vim.pack.add({
	"https://github.com/obsidian-nvim/obsidian.nvim",
	"https://github.com/OXY2DEV/markview.nvim",
})

require("obsidian").setup({
	legacy_commands = false,
	picker = {
		name = "mini.pick",
	},
	workspaces = {
		{
			name = "personal",
			path = "~/vault",
		},
	},
})

require("markview").setup({
	markdown = {
		code_blocks = {
			min_width = 80,
		},
	},
	typst = { enable = false },
})
