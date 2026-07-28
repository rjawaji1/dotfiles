vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
})

require("nvim-treesitter").setup()

require("nvim-treesitter").install({
	"bash",
	"fish",

	"python",
	"cpp",
	"c",
	"rust",
	"diff",
	"lua",
	"luadoc",
	"query",
	"vim",
	"vimdoc",
	"java",

	-- Docs
	"markdown",
	"markdown_inline",
	"typst",

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
