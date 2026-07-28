-- Easier Window movement
vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Jump to left split" })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Jump to split below" })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Jump to split above" })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Jump to right split" })

-- Easier Window Swapping
vim.keymap.set("n", "<leader>wH", "<C-w>H", { desc = "Swap split with left split" })
vim.keymap.set("n", "<leader>wJ", "<C-w>J", { desc = "Swap split with split below" })
vim.keymap.set("n", "<leader>wK", "<C-w>K", { desc = "Swap split with split above" })
vim.keymap.set("n", "<leader>wL", "<C-w>L", { desc = "Swap split with right split" })

-- Easy Splits
vim.keymap.set("n", "<leader>ws", "<cmd>split<cr>", { desc = "Horizontal bottom split" })
vim.keymap.set("n", "<leader>wv", "<cmd>vsplit<cr>", { desc = "Vertical right split" })

-- Window Deletions
vim.keymap.set("n", "<leader>wq", "<cmd>bdelete<cr>", { desc = "Close window" })
vim.keymap.set("n", "<leader>wo", "<cmd>%bd|e#|bd#<cr>", { desc = "Close windows except current" })

-- Yank to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })

-- Interactive visual line indent
vim.keymap.set({ "n", "v" }, "<", "<gv", { desc = "Visually indent line" })
vim.keymap.set({ "n", "v" }, ">", ">gv", { desc = "Visually indent line" })
