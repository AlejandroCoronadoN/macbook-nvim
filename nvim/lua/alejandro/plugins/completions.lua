-- completions.lua
return {
	{
		-- Plugin for nvim-cmp source for Neovim's built-in LSP
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		-- LuaSnip is a snippet engine for Neovim
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip", -- Source for LuaSnip completion
			"rafamadriz/friendly-snippets", -- A collection of snippets for multiple languages
		},
	},
	{
		-- nvim-cmp is a completion plugin for Neovim
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			-- Load VSCode style snippets from the friendly-snippets plugin
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- For luasnip users.
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
}
