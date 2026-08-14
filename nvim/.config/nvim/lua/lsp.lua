vim.diagnostic.config({
	virtual_text = false,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = true,
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
			[vim.diagnostic.severity.WARN] = "WarningMsg",
		},
	},
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(e)
		-- Highlight word under cursor
		local client = vim.lsp.get_client_by_id(e.data.client_id)
		if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, e.buf) then
			local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buf = e.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buf = e.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})

			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buf = event2.buf })
				end,
			})
		end

		-- Goto Keybinds
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buf = e.buf, desc = "Goto definition" })
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buf = e.buf, desc = "Goto declaration" })
		vim.keymap.set("n", "gr", vim.lsp.buf.references, { buf = e.buf, desc = "Goto references" })
		vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, { buf = e.buf, desc = "Goto type definition" })
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buf = e.buf, desc = "Goto implementation" })


		-- stylua: ignore start
		vim.keymap.set("n", "K", function() vim.lsp.buf.hover({ border = "rounded" }) end, { buf = e.buf, desc = "Hover" })
		vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { buf = e.buf, desc = "Perform code action" })
		vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { buf = e.buf, desc = "Rename symbol" })
		vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { buf = e.buf, desc = "Format buffer" })
		vim.keymap.set("n", "<leader>lk", vim.diagnostic.open_float, { buf = e.buf, desc = "Show lsp diagnotic float" })
		-- stylua: ignore end
	end,
})

vim.lsp.enable({
	"lua_ls",
	"jdtls",
	"clangd",
	"tinymist",

	-- Python
	"ty",
	"ruff",

	-- web
	"vue_ls",
	"vtsls",
	"oxfmt",
	"oxlint",
	"emmet",
	"cssls",
	"jsonls",
	"html",
	"superhtml",

	-- php
	"phpantom",
})
