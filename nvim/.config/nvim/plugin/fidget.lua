vim.pack.add({
	"https://github.com/j-hui/fidget.nvim",
})

vim.api.nvim_create_autocmd("LspAttach", {
	once = true,
	callback = function()
		require("fidget").setup({
			notification = {
				override_vim_notify = true,
			},
		})
	end,
})
