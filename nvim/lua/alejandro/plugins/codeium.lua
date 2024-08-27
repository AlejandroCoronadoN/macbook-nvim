-- ~/.config/nvim/lua/alejandro/plugins/codeium.lua

-- Setup codeium.nvim
require("codeium").setup({
	-- Add any specific configuration here if needed
	-- For example:
	-- config_path = "~/.config/nvim/codeium.json",
	-- enable_chat = true,
	-- api = {
	--     host = "codeium.example.com",
	--     port = 443,
	-- }
})

-- nvim-cmp configuration to use codeium as a source
local cmp = require("cmp")

cmp.setup({
	-- Other nvim-cmp setup options
	sources = {
		-- Other sources
		{ name = "codeium" },
	},
	formatting = {
		format = require("lspkind").cmp_format({
			mode = "symbol",
			maxwidth = 50,
			ellipsis_char = "...",
			symbol_map = { Codeium = "" },
		}),
	},
})
