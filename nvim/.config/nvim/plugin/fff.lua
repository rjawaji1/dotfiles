vim.pack.add({
	"https://github.com/dmtrKovalenko/fff.nvim",
})

local fff = require("fff")

fff.setup({
	title = nil,
	prompt = "> ",
	layout = {
		width = 0.9,
		height = 0.85,
		prompt_position = "top",
	},
})

vim.keymap.set("n", "<leader>f", function()
	fff.find_files()
end, { desc = "Open file picker" })
vim.keymap.set("n", "<leader>/", function()
	fff.live_grep()
end, { desc = "Global search in workspace folder" })
