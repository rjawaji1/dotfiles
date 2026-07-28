vim.api.nvim_create_autocmd("FileType", {
	pattern = { "typst", "markdown" },
	once = true,
	callback = function()
		vim.pack.add({
			"https://github.com/SylvanFranklin/omni-preview.nvim",

			-- Deps
			"https://github.com/chomosuke/typst-preview.nvim",
			"https://github.com/toppair/peek.nvim",
		})

		require("omni-preview").setup()

		vim.keymap.set("n", "<leader>po", "<cmd>OmniPreview start<cr>", { silent = true, desc = "Show Preview" })
		vim.keymap.set("n", "<leader>pc", "<cmd>OmniPreview stop<cr>", { silent = true, desc = "Stop Preview" })
	end,
})
