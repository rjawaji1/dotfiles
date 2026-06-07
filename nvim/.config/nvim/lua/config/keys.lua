-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Yank
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank selections to clipboard", noremap = true, silent = true })
