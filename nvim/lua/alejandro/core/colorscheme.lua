-- core/colorscheme.lua

-- Set colorscheme to gruvbox with protected call
local status, _ = pcall(vim.cmd, "colorscheme gruvbox")
if not status then
  print("Colorscheme not found!") -- print error if colorscheme not installed
  return
end

-- Set the highlight group for the cursor
vim.cmd [[
  highlight Cursor guibg=#FFA500
]]

-- Optional: Adjust other related highlight groups
vim.cmd [[
  highlight CursorLineNr guifg=#FFA500 guibg=NONE
]]
