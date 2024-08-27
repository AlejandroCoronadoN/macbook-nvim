-- Set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- Define highlight groups
vim.api.nvim_set_hl(0, "GeneralKeymap", { fg = "#FFD700" })
vim.api.nvim_set_hl(0, "MaximizerKeymap", { fg = "#00FF00" })
vim.api.nvim_set_hl(0, "NvimTreeKeymap", { fg = "#1E90FF" })
vim.api.nvim_set_hl(0, "TelescopeKeymap", { fg = "#FF4500" })
vim.api.nvim_set_hl(0, "DapKeymap", { fg = "#8A2BE2" })
vim.api.nvim_set_hl(0, "BufferlineKeymap", { fg = "#FF1493" })

-- Function to get all keymaps
local function get_keymaps()
	local keymaps = {}
	for _, mode in ipairs({ "", "i", "c", "v", "x", "t" }) do
		local maps = vim.api.nvim_get_keymap(mode)
		for _, map in ipairs(maps) do
			local lhs = map.lhs
			local rhs = map.rhs or map.callback and "<Lua function>" or "<N/A>"
			local mode_str = mode ~= "" and mode or "n"
			table.insert(keymaps, {
				lhs = lhs,
				rhs = rhs,
				mode = mode_str,
			})
		end
	end
	return keymaps
end

-- Telescope custom picker
local actions = require("telescope.actions")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local entry_display = require("telescope.pickers.entry_display")

local function make_displayer()
	return entry_display.create({
		separator = " ",
		items = {
			{ width = 4 }, -- mode
			{ width = 20 }, -- lhs
			{ remaining = true }, -- rhs
		},
	})
end

local function make_display(entry)
	local displayer = make_displayer()
	return displayer({
		{ entry.mode, entry.mode == "n" and "GeneralKeymap" or entry.mode },
		{ entry.lhs, entry.mode },
		{ entry.rhs, entry.mode },
	})
end

local function keymap_picker()
	pickers
		.new({}, {
			prompt_title = "Keymaps",
			finder = finders.new_table({
				results = get_keymaps(),
				entry_maker = function(entry)
					return {
						value = entry,
						display = make_display,
						ordinal = entry.lhs .. " " .. entry.rhs .. " " .. entry.mode,
						mode = entry.mode,
						lhs = entry.lhs,
						rhs = entry.rhs,
					}
				end,
			}),
			sorter = conf.generic_sorter({}),
			attach_mappings = function(prompt_bufnr, map)
				map("i", "<CR>", actions.select_default)
				map("n", "<CR>", actions.select_default)

				-- Add custom key mappings
				map("i", "<C-j>", actions.move_selection_next)
				map("i", "<C-k>", actions.move_selection_previous)
				map("i", "<C-h>", actions.move_to_top)
				map("i", "<C-l>", actions.move_to_bottom)
				map("n", "<C-j>", actions.move_selection_next)
				map("n", "<C-k>", actions.move_selection_previous)
				map("n", "<C-h>", actions.move_to_top)
				map("n", "<C-l>", actions.move_to_bottom)

				return true
			end,
		})
		:find()
end

vim.api.nvim_create_user_command("TelescopeKeymaps", keymap_picker, {})

-- Load Telescope extension if any
require("telescope").load_extension("fzf")
