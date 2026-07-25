vim.api.nvim_create_autocmd("BufWritePre", {
	once = true,
	callback = function()
		vim.pack.add({ "https://github.com/mfussenegger/nvim-lint" })
		require("lint").linters_by_ft = {
			-- React & HTML
			javascript = { "oxlint" },
			javascriptreact = { "oxlint" },
			typescript = { "oxlint" },
			typescriptreact = { "oxlint" },
		}
	end,
})
