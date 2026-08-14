vim.pack.add({
	"https://github.com/olrtg/nvim-emmet",
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "astro", "html", "css", "typescriptreact", "vue" },
	once = true,
	callback = function()
		vim.keymap.set({ "n", "v" }, "<leader>xe", require("nvim-emmet").wrap_with_abbreviation)
	end,
})
