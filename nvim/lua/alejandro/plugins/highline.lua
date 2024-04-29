local M = {}
local namespace_id

function M.init_highlights()
	vim.api.nvim_command(
		"highlight default HighlightLine guifg=#ff007c gui=bold ctermfg=198 cterm=bold ctermbg=darkgreen"
	)
	namespace_id = vim.api.nvim_create_namespace("HighlightLineNamespace")
end

function M.run_autocommands()
	vim.api.nvim_command("augroup HighlightLine")
	vim.api.nvim_command("autocmd!")
	vim.api.nvim_command("autocmd ColorScheme * lua require'highlights'.init_highlights()")
	vim.api.nvim_command("augroup end")
end

function M.highlight()
	local current_win = vim.api.nvim_get_current_win()
	local current_buf = vim.api.nvim_get_current_buf()
	local pos = vim.api.nvim_win_get_cursor(current_win)
	local row = pos[1] - 1
	local col = pos[2]

	local current_line = vim.api.nvim_buf_get_lines(current_buf, row, row + 1, false)[1]
	local end_col = string.len(current_line)

	vim.api.nvim_buf_set_extmark(
		current_buf,
		namespace_id,
		row,
		0,
		{ end_row = row, end_col = end_col, hl_group = "HighlightLine" }
	)
end

return M
