return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { { "nvim-mini/mini.icons", opts = {} } },
	lazy = false,
	keys = {
		{ "<leader>E", "<cmd>Oil<cr>", mode = "n", desc = "[E]xplore files" },
	},
}
