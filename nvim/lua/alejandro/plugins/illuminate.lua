-- plugins/illuminate.lua
require('illuminate').configure({
    providers = {
        'lsp',
        'treesitter',
        'regex',
    },
    delay = 100,
    filetypes_denylist = {
        'dirvish',
        'fugitive',
    },
    under_cursor = true,
})

-- Define custom highlight group for illuminated word with a subtle background change
vim.cmd [[
  highlight IlluminatedWordText guibg=#3C3836
  highlight IlluminatedWordRead guibg=#3C3836
  highlight IlluminatedWordWrite guibg=#3C3836
]]
