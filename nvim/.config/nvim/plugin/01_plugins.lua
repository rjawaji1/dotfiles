-- General packages where all you need is to call the setup function
vim.pack.add({

	-- HTML Tags
	"https://github.com/windwp/nvim-ts-autotag",
	"https://github.com/twhlynch/vim-sleuth",
})

require("nvim-ts-autotag").setup()
