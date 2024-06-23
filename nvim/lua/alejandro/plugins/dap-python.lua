local dap_python = require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
local dap = require("dap")

-- Function to get the correct Python path from pyenv
local function get_python_path()
	local pyenv_python = vim.fn.system("pyenv which python")
	--print("pyenv which python output: ", pyenv_python) -- Print the raw output
	local trimmed_python_path = vim.fn.trim(pyenv_python)
	--print("Trimmed Python path: ", trimmed_python_path) -- Print the trimmed path
	return trimmed_python_path
end

-- Configuration for Python debugging
dap.configurations.python = {
	{
		type = "python",
		request = "launch",
		name = "Launch test script",
		program = "/Users/coro/Desktop/Test/python/test_script.py", -- Update this to the correct path
		pythonPath = function()
			--print("Launch test script - Python path: ", path) -- Print the path for this configuration
			return path
		end,
		console = "integratedTerminal", -- Use an integrated terminal to see more outputs
		internalConsoleOptions = "neverOpen", -- Prevent internal console from opening
	},
}

--print("DAP Python path: " .. get_python_path())

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
