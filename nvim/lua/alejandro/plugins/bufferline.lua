-- plugins/bufferline.lua
require("bufferline").setup({
	options = {
		modified_icon = "●",
		show_close_icon = true,
		show_buffer_close_icons = true,
		diagnostics = "nvim_lsp",
		separator_style = "slant",
	},
})
