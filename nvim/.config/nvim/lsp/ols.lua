local function strip_archive_subpath(path)
	-- Matches regex from zip.vim / tar.vim
	path = vim.fn.substitute(path, "zipfile://\\(.\\{-}\\)::[^\\\\].*$", "\\1", "")
	path = vim.fn.substitute(path, "tarfile:\\(.\\{-}\\)::.*$", "\\1", "")
	return path
end

local function root_pattern(...)
	local patterns = vim.iter({ ... }):flatten(math.huge):totable()
	return function(startpath)
		startpath = strip_archive_subpath(startpath)
		for _, pattern in ipairs(patterns) do
			local match = (function(path)
				for _, p in ipairs(vim.fn.glob(table.concat({ path:gsub("([%[%]%?%*])", "\\%1"), pattern }, "/"), true, true)) do
					if vim.uv.fs_stat(p) then
						return path
					end
				end
			end)(startpath)

			if match ~= nil then
				local real = vim.uv.fs_realpath(match)
				return real or match -- fallback to original if realpath fails
			end
		end
	end
end

---@return string?
local function default_odin_root()
	-- https://odin-lang.org/docs/install/#release-requirements--notes
	local odin_root = os.getenv("ODIN_ROOT")
	if odin_root ~= nil and odin_root ~= "" then
		return vim.fs.normalize(odin_root)
	end

	-- https://github.com/odin-lang/Odin/wiki/Compiler-Flags
	local result = vim.system({ "odin", "root" }, { text = true }):wait()
	if result.code == 0 and result.stdout ~= nil then
		local stdout = vim.trim(result.stdout)
		return stdout ~= "" and vim.fs.normalize(stdout) or nil
	end
end

---@param fname string
---@return string?
local function is_library(fname)
	local odin_root = default_odin_root()
	if odin_root == nil then
		return nil
	end

	fname = vim.fs.normalize(fname)
	for _, lib in ipairs({ "base", "core", "vendor" }) do
		if vim.fs.relpath(vim.fs.joinpath(odin_root, lib), fname) ~= nil then
			local clients = vim.lsp.get_clients({ name = "ols" })
			return #clients > 0 and clients[#clients].config.root_dir or nil
		end
	end
end

---
---@type vim.lsp.Config
return {
	cmd = { "ols" },
	filetypes = { "odin" },
	root_dir = function(bufnr, on_dir)
		local fname = vim.api.nvim_buf_get_name(bufnr)
		local reused_dir = is_library(fname)
		if reused_dir then
			on_dir(reused_dir)
			return
		end

		on_dir(root_pattern("ols.json", ".git", "*.odin")(fname))
	end,
}
