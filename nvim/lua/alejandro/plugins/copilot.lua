-- plugins/copilot.lua

-- Prevent Copilot from mapping the tab key
vim.g.copilot_no_tab_map = true

-- Set key binding for accepting suggestions
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- Define filetypes where Copilot is enabled or disabled
vim.g.copilot_filetypes = {
  ["*"] = true,
  ["markdown"] = false,
  ["plaintext"] = false,
}

-- Define custom commands for Copilot
vim.cmd([[
  command! CopilotEnable :let g:copilot_enabled = 1 | echo "Copilot enabled"
  command! CopilotDisable :let g:copilot_enabled = 0 | echo "Copilot disabled"
  command! CopilotToggle :let g:copilot_enabled = !g:copilot_enabled | echo "Copilot toggled"
]])
