-- obsidian.lua

-- Ensure the 'epwalsh/obsidian.nvim' is installed already, typically via a plugin manager such as `vim-plug` or `packer.nvim`.
-- Example for packer.nvim:
-- use { 'epwalsh/obsidian.nvim', requires = "nvim-lua/plenary.nvim" }

-- Set up obsidian.nvim with your vault path
require("obsidian").setup({
	dir = "~/Documents/Obsidian Vault/",
})
