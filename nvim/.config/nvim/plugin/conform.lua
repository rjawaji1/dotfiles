vim.api.nvim_create_autocmd("BufWritePre", {
	once = true,
	callback = function()
		vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

		require("conform").setup({
			notify_on_error = true,
			formatters_by_ft = {
				lua = { "stylua" },

				odin = { "odinfmt" },

				-- Java
				java = { "palantir-java-format" },

				-- C & CPP
				c = { "clang-format" },
				h = { "clang-format" },
				cpp = { "clang-format" },
				gpp = { "clang-format" },

				-- React & HTML
				html = { "prettier" },
				css = { "prettier" },
				json = { "oxfmt" },
				jsonc = { "oxfmt" },

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
			formatters = {
				odinfmt = {
					-- Change where to find the command if it isn't in your path.
					command = "odinfmt",
					args = { "-stdin" },
					stdin = true,
				},
			},
		})
	end,
})
