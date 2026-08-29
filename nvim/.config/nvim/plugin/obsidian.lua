vim.pack.add({
	"https://github.com/obsidian-nvim/obsidian.nvim",
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
