vim.pack.add({
	"https://github.com/nvim-mini/mini.icons",
	"https://github.com/nvim-mini/mini.pick",
	"https://github.com/nvim-mini/mini.bufremove",
})

require("mini.icons").setup()
require("mini.pick").setup({
	window = {
		config = function()
			local height = math.floor(0.8 * vim.o.lines)
			local width = math.floor(0.8 * vim.o.columns)
			return {
				anchor = "NW",
				height = height,
				width = width,
				row = math.floor(0.20 * (vim.o.lines - height)),
				col = math.floor(0.50 * (vim.o.columns - width)),
			}
		end,
	},
})

vim.keymap.set("n", "<leader>f", "<cmd>Pick files<cr>", { desc = "Open file picker" })
vim.keymap.set("n", "<leader>b", "<cmd>Pick buffers<cr>", { desc = "Open buffer picker" })
vim.keymap.set("n", "<leader>/", "<cmd>Pick grep_live<cr>", { desc = "Global search in workspace folder" })
vim.keymap.set("n", "<leader>h", "<cmd>Pick help<cr>", { desc = "Open help picker" })
