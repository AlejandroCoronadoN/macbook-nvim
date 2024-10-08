require("alejandro.plugins-setup")
vim.g.python3_host_prog = vim.fn.trim(vim.fn.system("pyenv which python"))
require("alejandro.core.options")
require("alejandro.core.refactor")
require("alejandro.core.keymaps")
require("alejandro.core.colorscheme")
require("alejandro.plugins.comment")
require("alejandro.plugins.nvim-tree")
require("alejandro.plugins.lualine")
require("alejandro.plugins.telescope")
require("alejandro.plugins.nvim-cmp")
require("alejandro.plugins.lsp.mason")
require("alejandro.plugins.lsp.lspsaga")
require("alejandro.plugins.lsp.lspconfig")
require("alejandro.plugins.lsp.null-ls")
require("alejandro.plugins.autopairs")
require("alejandro.plugins.treesitter")
require("alejandro.plugins.gitsigns")
require("alejandro.plugins.highline")
require("alejandro.plugins.interestingwords")
require("alejandro.plugins.dap-python")
require("alejandro.plugins.dap-js")
require("alejandro.plugins.dap-ui")
require("alejandro.plugins.bufferline")
require("alejandro.plugins.signify")
require("alejandro.plugins.illuminate")
require("alejandro.plugins.ts-autotag")
require("alejandro.plugins.copilot")
require("alejandro.plugins.toggleterm")
require("alejandro.plugins.diffview")
require("alejandro.plugins.dashboard")
require("alejandro.plugins.obsidian")
require("alejandro.plugins.vim-markdown")
require("alejandro.plugins.gp")
require("alejandro.plugins.completions")
require("alejandro.plugins.snippets")
