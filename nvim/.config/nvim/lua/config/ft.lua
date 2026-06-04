vim.filetype.add({
	extension = {
		asm = "lc3",
		lc3 = "lc3",
	},
})

--- @param filetype string
--- @param callback function
--- @return nil
local function ft_config(filetype, callback)
	vim.api.nvim_create_autocmd("FileType", {
		pattern = filetype,
		callback = callback,
	})
end

ft_config("lc3", function()
	vim.bo.commentstring = "; %s"
	vim.bo.expandtab = false
end)

ft_config("typst", function()
	vim.bo.shiftwidth = 4
end)

ft_config("lua", function()
	vim.bo.expandtab = false
end)

local web_languages = {
	"javascript",
	"typescript",
	"jsx",
	"tsx",
	"json",
	"html",
	"css",
}

for _, filetype in ipairs(web_languages) do
	ft_config(filetype, function()
		vim.bo.tabstop = 2
		vim.bo.softtabstop = 2
		vim.bo.shiftwidth = 2
	end)
end

local textwidths = {
	c = 80,
	cpp = 100,
	rust = 100,
	typst = 80,
	markdown = 80,
	sql = 80,
	lc3 = 80,
}

for filetype, textwidth in pairs(textwidths) do
	ft_config(filetype, function()
		vim.bo.textwidth = textwidth
		vim.opt.colorcolumn = tostring(textwidth)
	end)
end
