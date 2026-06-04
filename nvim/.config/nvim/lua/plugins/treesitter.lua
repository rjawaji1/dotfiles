return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",

	config = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "TSUpdate",
			callback = function()
				local parsers = require("nvim-treesitter.parsers")

				-- Custom parsers go here
				parsers.lc3 = {
					install_info = {
						url = "https://github.com/dxrcy/tree-sitter-lc3",
						branch = "master",
						queries = "queries",
					},
				}
			end,
		})

		require("nvim-treesitter").install({
			"zig",
			"rust",
			"lc3",
			"cpp",
			"c",

			-- Web Development
			"html",
			"css",
			"jsx",
			"tsx",
			"typescript",
			"javascript",
			"astro",

			"diff",
			"query",
		})

		vim.api.nvim_create_autocmd("FileType", {
			desc = "Enable treesitter in supported buffers",
			callback = function()
				local ok = pcall(vim.treesitter.start)
				if not ok then
					return
				end
			end,
		})
	end,
}
