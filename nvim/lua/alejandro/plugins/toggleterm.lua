-- lua/alejandro/plugins/toggleterm.lua

require("toggleterm").setup({
    size = 75,  -- Width of the vertical split
    open_mapping = [[<PageDown>]],  -- Keybinding to toggle the terminal
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = 'vertical',  -- Open terminal in a vertical split
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
      border = 'curved',
      winblend = 3,
      highlights = {
        border = "Normal",
        background = "Normal",
      },
    },
  })
  
  -- Configure toggleterm keybindings
  vim.api.nvim_set_keymap('n', '<PageDown>', ":ToggleTerm direction=vertical<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap('t', '<PageDown>', "<C-\\><C-n>:ToggleTerm<CR>", { noremap = true, silent = true })
  