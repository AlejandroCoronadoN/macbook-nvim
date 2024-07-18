-- mini-move.lua

-- Require 'mini.move' for moving lines and blocks
require("mini.move").setup({
	mappings = {
		left = "<M-Left>",
		right = "<M-Right>",
		down = "<M-Down>",
		up = "<M-Up>",
	},
})
