return {
	"stevearc/oil.nvim",
	opts = {
		columns = {
			"icon",
			"permissions",
		},
	},
	dependencies = { { "nvim-mini/mini.icons", opts = {} } },
	lazy = false,
	keys = {
		{ "<leader>e", "<cmd>Oil<cr>", mode = "n", desc = "[E]xplore files" },
	},
}
