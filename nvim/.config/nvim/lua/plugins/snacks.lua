return {
	"folke/snacks.nvim",
	opts = {
		statuscolumn = { enabled = true },
		lazygit = { enabled = true },
		git = { enabled = true },
		bigfile = { enabled = true },
		bufdelete = { enabled = true },
		indent = { enabled = true },
		image = {
			enabled = true,
			math = { enabled = false },
		},
		notifier = {
			enabled = true,
			timeout = 5000,
		},
		notify = {
			enabled = true,
		},
		input = { enabled = true },
	},
	keys = {
		--stylua: ignore start
		{ "<leader>b", function() Snacks.picker.buffers() end, desc = "Open buffer picker" },
		{ "<leader>/", function() Snacks.picker.grep() end, desc = "Global search in workspace folder" },
		{ "<leader>f", function() Snacks.picker.files() end, desc = "Open file picker" },
		-- { "<leader>E", function() Snacks.explorer() end, desc = "File Explorer" },
		--stylua: ignore end
	},
}
