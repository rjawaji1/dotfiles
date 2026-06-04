return { -- Autocompletion
	"saghen/blink.cmp",
	event = "VeryLazy",
	dependencies = {
		"saghen/blink.lib",
		"rafamadriz/friendly-snippets",
		"L3MON4D3/LuaSnip",
	},

	build = function()
		require("blink.cmp").build():wait(60000)
	end,

	--- @module "blink.cmp"
	--- @type blink.cmp.Config
	opts = {
		keymap = { preset = "default" },

		appearance = {
			nerd_font_variant = "mono",
		},

		completion = {
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 500,
				treesitter_highlighting = true,
			},
			ghost_text = { enabled = false },
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
			per_filetype = {
				lua = { inherit_defaults = true, "lazydev" },
				lc3 = { inherit_defaults = true, "elk" },
			},
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
				buffer = {
					min_keyword_length = 5,
					max_items = 5,
				},
				elk = { module = "elk.cmp" },
			},
		},

		snippets = { preset = "luasnip" },

		fuzzy = { implementation = "rust" },

		cmdline = { enabled = true },

		signature = { enabled = true },
	},
}
