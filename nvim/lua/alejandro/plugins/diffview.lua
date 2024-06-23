-- lua/alejandro/plugins/diffview.lua

require('diffview').setup({
    use_icons = true,  -- Requires nvim-web-devicons
    icons = {
      folder_closed = "",
      folder_open = "",
    },
    signs = {
      fold_closed = "",
      fold_open = "",
    },
    view = {
      default = {
        layout = "diff2_horizontal",
        winbar_info = true,
      },
    },
  })
  
  -- Configure diffview keybindings
  vim.api.nvim_set_keymap('n', '<leader>dv', ":DiffviewOpen<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>dc', ":DiffviewClose<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>dh', ":DiffviewFileHistory<CR>", { noremap = true, silent = true })
  