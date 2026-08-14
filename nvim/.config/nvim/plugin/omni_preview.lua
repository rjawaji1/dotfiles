vim.pack.add({
	"https://github.com/SylvanFranklin/omni-preview.nvim",

	-- Deps
	"https://github.com/chomosuke/typst-preview.nvim",
	"https://github.com/toppair/peek.nvim",
	"https://github.com/barrettruth/live-server.nvim",
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "typst", "markdown", "html" },
	once = true,
	callback = function()
		require("omni-preview").setup()
		require("peek").setup({ app = "browser" })

		vim.keymap.set("n", "<leader>po", "<cmd>OmniPreview start<cr>", { silent = true, desc = "Show Preview" })
		vim.keymap.set("n", "<leader>pc", "<cmd>OmniPreview stop<cr>", { silent = true, desc = "Stop Preview" })
	end,
})
