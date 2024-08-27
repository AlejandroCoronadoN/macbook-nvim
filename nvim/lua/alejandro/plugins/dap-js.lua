local dap = require("dap")

-- Configure the adapter using the Mason path
dap.adapters.node2 = {
	type = "executable",
	command = "node",
	args = { vim.fn.stdpath("data") .. "/mason/packages/node-debug2-adapter/out/src/nodeDebug.js" },
}

-- JavaScript and TypeScript configurations
dap.configurations.javascript = {
	{
		type = "node2",
		request = "launch",
		name = "Launch Program",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		console = "integratedTerminal",
	},
}

dap.configurations.typescript = {
	{
		type = "node2",
		request = "launch",
		name = "Launch Program",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		console = "integratedTerminal",
	},
}
