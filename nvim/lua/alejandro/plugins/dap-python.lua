local dap_python = require("dap-python")
dap_python.setup("~/.virtualenvs/debugpy/bin/python")
dap_python.test_runner = "pytest"

local dap = require("dap")

-- Function to get the correct Python path from pyenv
local function get_python_path()
	local pyenv_python = vim.fn.system("pyenv which python")
	local trimmed_python_path = vim.fn.trim(pyenv_python)
	return trimmed_python_path
end

-- Configuration for Python debugging
dap.configurations.python = {
	{
		type = "python",
		request = "launch",
		name = "Launch file",
		program = function()
			-- Get the current buffer's file path
			return vim.fn.expand("%:p")
		end,
		pythonPath = function()
			return get_python_path()
		end,
		console = "integratedTerminal", -- Use an integrated terminal to see more outputs
		internalConsoleOptions = "neverOpen", -- Prevent internal console from opening
	},
}

-- Add event listeners to capture additional details
dap.listeners.after.event_initialized["dapui_config"] = function()
	print("DAP initialized")
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	print("DAP terminated")
end
dap.listeners.before.event_exited["dapui_config"] = function()
	print("DAP exited")
end
