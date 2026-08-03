-- https://clangd.llvm.org/extensions.html#switch-between-sourceheader
local function switch_source_header(bufnr, client)
	local method_name = "textDocument/switchSourceHeader"
	---@diagnostic disable-next-line:param-type-mismatch
	if not client or not client:supports_method(method_name) then
		return vim.notify(("method %s is not supported by any servers active on the current buffer"):format(method_name))
	end
	local params = vim.lsp.util.make_text_document_params(bufnr)
	---@diagnostic disable-next-line:param-type-mismatch
	client:request(method_name, params, function(err, result)
		if err then
			error(tostring(err))
		end
		if not result then
			vim.notify("corresponding file cannot be determined")
			return
		end
		vim.cmd.edit(vim.uri_to_fname(result))
	end, bufnr)
end

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		local bufnr = args.buf

		if not client or client.name ~= "clangd" then
			return
		end

		vim.keymap.set("n", "<leader>gsh", function()
			switch_source_header(bufnr, client)
		end, {
			buf = args.buf,
			desc = "Goto Source/Header",
		})
	end,
})

---@type vim.lsp.Config
return {
	cmd = {
		"clangd",
		"--clang-tidy",
		"--background-index",
		"--completion-style=detailed",
		"--header-insertion=iwyu",
		"--header-insertion-decorators",
	},
	filetypes = {
		"c",
		"h",
		"cpp",
		"hpp",
		"cc",
		"objc",
		"objcpp",
		"cuda",
	},
	root_markers = {
		".clangd",
		".clang-tidy",
		".clang-format",
		"compile_commands.json",
		"compile_flags.txt",
		"configure.ac",
		".git",
	},
}
