return {
	"Shatur/neovim-ayu",
	config = function()
		require("ayu").setup({
			overrides = {
				-- Base
				Normal = { bg = "#020202" },
				NormalFloat = { bg = "#020202" },
				FloatBorder = { bg = "#020202" },

				-- Variables
				Identifier = { fg = "#dedede" },
				["@variable"] = { fg = "#dedede" },

				-- Keywords
				Keyword = { fg = "#FF8732" }, -- orange
				["@keyword"] = { fg = "#FF8732" },
				["@keyword.conditional"] = { fg = "#FF8732" },
				["@keyword.repeat"] = { fg = "#FF8732" },

				-- Storage
				StorageClass = { fg = "#CFCA0D" },
				["@keyword.modifier"] = { fg = "#d2a6ff" },

				-- Constructors
				["@constructor"] = { fg = "#d2a6ff" },

				-- Builtin types
				["@type.builtin"] = {
					fg = "#73D0FF",
					italic = true,
				},

				-- Inline/block code
				["@markup.raw"] = { bg = "#0D0D0D" },
				["@markup.raw.block"] = { bg = "#0D0D0D" },

				-- Cursor
				Cursor = {
					fg = "#0D0D0D",
					bg = "#dedede",
				},
			},
		})

		vim.cmd.colorscheme("ayu-dark")

		-- Diagnostic undercurls
		vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", {
			undercurl = true,
			sp = "#DD3E25",
		})

		vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", {
			undercurl = true,
			sp = "#FF8732",
		})

		vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", {
			undercurl = true,
			sp = "#CFCA0D",
		})

		vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", {
			undercurl = true,
			sp = "#FFFFFF",
		})

		vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", {
			fg = "#DD3E25",
		})

		vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", {
			fg = "#FF8732",
		})

		vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", {
			fg = "#CFCA0D",
		})

		vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", {
			fg = "#FFFFFF",
		})
	end,
}
