-- twilight.lua

-- Require 'twilight' for dimming inactive code
require("twilight").setup({
	dimming = {
		alpha = 0.25, -- amount of dimming
		color = { "Normal", "#ffffff" },
		inactive = true,
	},
})
