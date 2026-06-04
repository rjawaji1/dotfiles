return {
	"nvim-lualine/lualine.nvim",
	opts = {
		options = {
			component_separators = "",
			section_separators = "",
			globalstatus = true,
		},
		sections = {
			lualine_b = {
				{ "branch", icon = "" },
			},
		},
	},
}
