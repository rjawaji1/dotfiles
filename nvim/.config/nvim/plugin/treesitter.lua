vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
})

require("nvim-treesitter").setup()

require("nvim-treesitter").install({
	"bash",
	"python",
	"cpp",
	"c",
	"rust",
	"diff",
	"lua",
	"luadoc",
	"markdown",
	"markdown_inline",
	"query",
	"vim",
	"vimdoc",
	"java",

	-- web
	"html",
	"css",
	"typescript",
	"tsx",
	"javascript",
	"jsx",
	"astro",
	"vue",
})

vim.api.nvim_create_autocmd("FileType", {
	desc = "Enable treesitter in supported buffers",
	callback = function()
		pcall(vim.treesitter.start)
		-- Use treesitter indentation
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
