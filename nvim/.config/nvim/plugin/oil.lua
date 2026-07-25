vim.pack.add({
	"https://github.com/stevearc/oil.nvim",
})

require("oil").setup({
	columns = {
		"icon",
		"permissions",
	},
})

vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>", { desc = "Oil" })
