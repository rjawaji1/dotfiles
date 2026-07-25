vim.pack.add({ "https://github.com/neanias/everforest-nvim" })

require("everforest").setup({
	on_highlights = function(hl, palette)
		-- Indent Guides
		hl.BlinkIndentOrange = { fg = palette.orange }
		hl.BlinkIndentViolet = { fg = palette.purple }
		hl.BlinkIndentBlue = { fg = palette.blue }

		-- Pairs
		hl.BlinkPairsOrange = { fg = palette.orange }
		hl.BlinkPairsViolet = { fg = palette.purple }
		hl.BlinkPairsBlue = { fg = palette.blue }
	end,
})
require("everforest").load()
