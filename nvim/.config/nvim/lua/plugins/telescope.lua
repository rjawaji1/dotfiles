return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-ui-select.nvim",
	},
	opts = function()
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("ui-select")
		return {
			defaults = {
				layout_strategy = "horizontal",
				layout_config = {
					prompt_position = "top",
				},
				sorting_strategy = "ascending",
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		}
	end,
	keys = {
		{ "<leader>f", "<cmd>Telescope find_files<cr>", mode = "", desc = "find [f]iles" },
		{ "<leader>b", "<cmd>Telescope buffers<cr>", mode = "", desc = "find [b]uffer" },
		{ "<leader>/", "<cmd>Telescope live_grep<cr>", mode = "", desc = "live grep" },
	},
}
