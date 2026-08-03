if vim.loader then
	vim.loader.enable()
end

require("opts")
require("keys")
require("autocmds")
require("ft")
require("lsp")
