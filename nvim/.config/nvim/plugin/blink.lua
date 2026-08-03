vim.pack.add({
	"https://github.com/saghen/blink.lib",

	"https://github.com/saghen/blink.cmp",
	"https://github.com/saghen/blink.pairs",
	"https://github.com/saghen/blink.indent",

	-- Deps
	"https://github.com/rafamadriz/friendly-snippets",
	"https://github.com/folke/lazydev.nvim",
})

vim.api.nvim_create_autocmd("FileType", {
	once = true,
	pattern = { "lua" },
	callback = function()
		require("lazydev").setup({
			library = {
				"~/.local/share/nvim/lazy/",

				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		})
	end,
})

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
	once = true,
	callback = function()
		require("blink.indent").setup({
			static = {
				char = "│",
			},
			scope = {
				char = "│",
			},
		})
	end,
})

vim.api.nvim_create_autocmd({ "InsertEnter", "CmdlineEnter" }, {
	once = true,
	callback = function()
		require("blink.cmp").setup({
			keymap = { preset = "default" },
			appearance = {
				-- Icon spacing
				nerd_font_variant = "mono",
			},
			completion = {
				-- `<c-space>` to show documentation or `auto_show` to true
				documentation = { auto_show = true, auto_show_delay_ms = 500 },
				menu = {
					border = "none",
				},
			},
			snippets = { preset = "luasnip" },
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
				per_filetype = {
					lua = { inherit_defaults = true, "lazydev" },
				},
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
			},

			fuzzy = { implementation = "prefer_rust_with_warning" },
			signature = { enabled = true },
		})

		require("blink.pairs").setup({})
	end,
})
