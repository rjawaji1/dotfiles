-- Auto resize split windows
vim.api.nvim_create_autocmd("VimResized", {
	desc = "Auto resize split windows",
	pattern = "*",
	command = "tabdo wincmd =",
})
