require("toggleterm").setup({
	size = 20,
	open_mapping = [[<c-\>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	terminal_mappings = true,
	persist_size = true,
	direction = "horizontal",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 3,
	},
})

local Terminal = require("toggleterm.terminal").Terminal

-- Function to open a new terminal in a horizontal split
local function open_horizontal_terminal()
	local term = Terminal:new({
		direction = "horizontal",
		on_open = function(term)
			vim.cmd("startinsert!")
		end,
		on_close = function(term)
			vim.cmd("startinsert!")
		end,
	})
	term:toggle()
end

-- Create a key mapping to open a new horizontal terminal
vim.api.nvim_set_keymap("n", "<leader>th", ":lua open_horizontal_terminal()<CR>", { noremap = true, silent = true })
