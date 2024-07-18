-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
	print("Lualine import failed.")
	return
end

-- get lualine nightfly theme
local lualine_nightfly = require("lualine.themes.nightfly")

local os = os

-- Function to get iTerm2 profile and set color
local function get_item_profile()
	local profile = os.getenv("ITERM_PROFILE") or "unknown"
	-- Define profiles and their colors
	local profiles_to_colors = {
		session1 = "#7e0191",
		session2 = "#006400",
		session3 = "#1812b5", -- Corrected hex color
		session4 = "#653621",
	}

	-- Get color by profile name or default to a grey color
	local color = profiles_to_colors[profile] or "#A9A9A9"
	vim.cmd("highlight LineSpecial guibg=" .. color)
	return string.format("%%#LineSpecial#[ Profile: %s ]%%*", profile)
end

-- new colors for theme
local new_colors = {
	blue = "#05524b",
	green = "#55224",
	violet = "#FF61EF",
	yellow = "#FFDA7B",
	black = "#000000",
	orange = "#FFA500", -- orange color for the path
	red = "#FF0000", -- red color for modified files
	green_commit = "#00FF00", -- green color for committed files
}

-- change nightfly theme colors
lualine_nightfly.normal.a.bg = new_colors.blue
lualine_nightfly.insert.a.bg = new_colors.green
lualine_nightfly.visual.a.bg = new_colors.violet
lualine_nightfly.command = {
	a = {
		gui = "bold",
		bg = new_colors.yellow,
		fg = new_colors.black,
	},
}

-- custom function to get relative path and style it with orange color and a decorator
local function relative_path()
	return "%#MyOrange#" .. "  " .. vim.fn.expand("%:~:.") .. " " .. "%*"
end

-- custom function to check if the file is modified since last commit and use a filled circle
local function git_diff()
	local git_status = vim.fn.systemlist("git status --porcelain " .. vim.fn.expand("%:p"))
	for _, line in ipairs(git_status) do
		if line:match("^%s*M%s") or line:match("^A%s") then
			return "%#MyGreen#" .. " ●" .. "%*" -- Green circle if modified and added
		elseif line:match("^%s*M") then
			return "%#MyRed#" .. " ●" .. "%*" -- Red circle if modified but not added
		end
	end
	return ""
end

-- custom function to get the last modification time in HH:MM format
local function last_modified()
	return vim.fn.strftime("%H:%M", vim.fn.getftime(vim.fn.expand("%:p")))
end

-- configure lualine with modified theme
lualine.setup({
	options = {
		theme = lualine_nightfly,
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
		globalstatus = true, -- ensure only one status line at the bottom, even with splits
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = { last_modified },
		lualine_y = { get_item_profile }, -- Move it to the proper section
		lualine_z = { "branch" },
	},
	winbar = {
		lualine_c = {
			function()
				return relative_path() .. git_diff()
			end,
		},
	},
	inactive_winbar = {
		lualine_c = {
			function()
				return relative_path() .. git_diff()
			end,
		},
	},
	tabline = {},
	extensions = {},
})

-- Define highlight groups for colors
vim.cmd([[
  highlight MyOrange guifg=#FFA500
  highlight MyRed guifg=#FF0000
  highlight MyGreen guifg=#00FF00
]])
