-- lsp.lua

-- Require 'lspconfig' for configuring language servers
local lspconfig = require("lspconfig")

-- Configure a language server (example: pyright for Python)
lspconfig.pyright.setup({
	on_attach = function(client, bufnr)
		-- Add border to hover window
		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
	end,
})
