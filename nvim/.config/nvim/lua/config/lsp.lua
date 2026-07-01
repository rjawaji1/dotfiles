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
	callback = function(e)
		-- Goto Keybinds
		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { buf = e.buf, desc = "Goto definition" })
		vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { buf = e.buf, desc = "Goto declaration" })
		vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { buf = e.buf, desc = "Goto references" })
		vim.keymap.set("n", "<leader>gy", vim.lsp.buf.type_definition, { buf = e.buf, desc = "Goto type definition" })
		vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { buf = e.buf, desc = "Goto implementation" })

		-- stylua: ignore start
		vim.keymap.set("n", "K", function() vim.lsp.buf.hover({ border = "rounded" }) end, { buf = e.buf, desc = "Hover" })
		vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, { buf = e.buf, desc = "Perform code action" })
		vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buf = e.buf, desc = "Rename symbol" })
		vim.keymap.set("n", "<leader>lk", vim.diagnostic.open_float, { buf = e.buf, desc = "Show lsp diagnotic float" })
		-- stylua: ignore end
	end,
})
