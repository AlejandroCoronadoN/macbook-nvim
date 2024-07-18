-- codeium.lua

-- Disable default bindings to avoid conflicts
vim.g.codeium_disable_bindings = 1

-- Set your own keybindings for Codeium
vim.api.nvim_set_keymap("i", "<C-g>", "codeium#Accept()", { expr = true, noremap = true, silent = true })
