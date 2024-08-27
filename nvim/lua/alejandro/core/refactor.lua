-- lua/alejandro/core/refactor.lua
local M = {}

function M.refactor_file()
	local current_file = vim.fn.expand("%:p")
	local user_text = vim.fn.input("Enter refactor request: ")

	-- Ask for the model if not provided
	local model = vim.fn.input("Enter model (default: gpt-4): ")
	if model == "" then
		model = "gpt-4"
	end

	-- Save the file before refactoring
	vim.cmd("write")

	-- Command to invoke the refactor script with the model

	local cmd = 'refactor "' .. current_file .. '" "' .. user_text .. '" ' .. model
	-- Add --check flag if user_text starts with '-' or is empty
	if user_text:match("^%-") or user_text == "" then
		cmd = cmd .. " --check"
	end

	-- Execute the command and reload the file
	vim.cmd("!clear && " .. cmd)
	vim.cmd("edit!")
end

return M
