vim.pack.add({
	"https://github.com/nvim-lualine/lualine.nvim",
})

require("lualine").setup({
	options = {
		component_separators = "",
		section_separators = "",
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { { "branch", icon = "" }, "diff", "diagnostics" },
		lualine_c = { { "filename", path = 1 } },
		lualine_x = { "filetype" },
		lualine_y = {},
	},
})
