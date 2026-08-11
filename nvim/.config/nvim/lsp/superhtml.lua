---@type vim.lsp.Config
return {
	cmd = { "superhtml", "lsp" },
	filetypes = { "superhtml", "html" },
	root_markers = { ".git" },
	on_attach = function(client, bufnr)
		-- Disable formatting completely for this server
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end,
}
