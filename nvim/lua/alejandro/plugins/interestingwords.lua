-- Set leader key to space
vim.g.mapleader = " "

-- Load interestingwords plugin and set keybindings
require("interestingwords").setup({
	colors = {
		"#aeee00",
		"#ff0000",
		"#0000ff",
		"#b88823",
		"#ffa724",
		"#ff2c4b",
		"#33FF57",
		"#3357FF",
		"#FF33A1",
		"#A133FF",
		"#FF8C33",
		"#33FF8C",
		"#8C33FF",
		"#FF3333",
		"#33FF33",
		"#3333FF",
		"#FF33FF",
		"#33FFFF",
		"#FFFF33",
		"#FF6633",
		"#33FF66",
		"#6633FF",
		"#FF3366",
		"#66FF33",
		"#3366FF",
		"#FF33CC",
		"#CC33FF",
		"#33CCFF",
		"#FFCC33",
		"#CCFF33",
		"#33FFCC",
		"#FF3333",
		"#33FF33",
		"#3333FF",
	},
	search_count = true,
	navigation = true,
	scroll_center = true,
	search_key = "<leader>m",
	cancel_search_key = "<leader>M",
	color_key = "<leader>k",
	cancel_color_key = "<leader>K",
})

-- Define the function to clear all highlights
local function clear_all_highlights()
	local bufnr = vim.api.nvim_get_current_buf()

	-- Get the namespace ID for interestingwords and clear it
	local namespaces = vim.api.nvim_get_namespaces()
	for name, id in pairs(namespaces) do
		if name:match("^interestingwords") then
			vim.api.nvim_buf_clear_namespace(bufnr, id, 0, -1)
		end
	end

	print("All highlights cleared.")
end
