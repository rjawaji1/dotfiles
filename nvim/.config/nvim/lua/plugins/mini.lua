return {
	{
		"nvim-mini/mini.icons",
		init = function()
			require("mini.icons").mock_nvim_web_devicons()
		end,
	},
	{
		"nvim-mini/mini.surround",
		opts = {},
	},
}
