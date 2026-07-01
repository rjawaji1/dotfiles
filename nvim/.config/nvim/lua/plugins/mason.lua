local lsp_list = {
	"clangd",
	"cssls",
	"html",
	"emmet",
	"vtsls",
	"phpactor",
	"tailwindcss",
}

return { -- Lsp Config
	"mason-org/mason-lspconfig.nvim",
	opts = {},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		{
			"neovim/nvim-lspconfig",
			init = function()
				local lsp_path = require("lazy.core.config").options.root .. "/nvim-lspconfig"
				vim.opt.runtimepath:prepend(lsp_path)
			end,
		},
	},
	config = function()
		vim.lsp.enable(lsp_list)
	end,
}
