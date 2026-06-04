-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Yank
vim.keymap.set(
	{ "n", "v" },
	"<leader>y",
	[["+y]],
	{ desc = "Copy selection to system clipboard", noremap = true, silent = true }
)
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy line to the system clipboard", noremap = true, silent = true })

vim.keymap.set("n", "<leader>l", vim.lsp.buf.format, { noremap = true, desc = "lsp format" })
