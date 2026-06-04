return { -- File Explorer
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
	lazy = false, -- neo-tree will lazily load itself
	keys = {
		{
			"<leader>e",
			"<cmd>Neotree filesystem toggle right<cr>",
			mode = "",
			desc = "[e] explore file tree",
		},
		{
			"<leader>z",
			"<cmd>Neotree filesystem toggle float<cr>",
			mode = "",
			desc = "explore file tree float",
		},
	},
}
