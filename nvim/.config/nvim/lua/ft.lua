vim.filetype.add({ extension = { typ = "typst" } })

---@param filetype string
---@param callback function
---@return nil
local function ft_config(filetype, callback)
	vim.api.nvim_create_autocmd("FileType", {
		pattern = filetype,
		callback = callback,
	})
end

local textwidths = {
	c = 80,
	typescript = 120,
	typescriptreact = 120,
	java = 120,
}

for filetype, textwidth in pairs(textwidths) do
	ft_config(filetype, function()
		vim.bo.textwidth = textwidth
		vim.opt.colorcolumn = tostring(textwidth)
	end)
end
