vim.api.nvim_create_autocmd("BufWritePre", {
	once = true,
	callback = function()
		vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

		require("conform").setup({
			notify_on_error = true,
			formatters_by_ft = {
				lua = { "stylua" },

				-- C & CPP
				c = { "clang-format" },
				h = { "clang-format" },
				cpp = { "clang-format" },
				gpp = { "clang-format" },

				-- React & HTML
				javascript = { "oxfmt" },
				javascriptreact = { "oxfmt" },
				typescript = { "oxfmt" },
				typescriptreact = { "oxfmt" },

				-- Web Frameworks
				vue = { "oxfmt" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		})
	end,
})
