-- Mock example configuration for an assumed 'template.nvim' plugin
require("template").setup({
	templates = {
		markdown = {
			tool = "~/Documents/Obsidian Vault/7-templates/Tool Template.md",
			project = "~/Documents/Obsidian Vault/7-templates/Project Template.md",
			requirements = "~/Documents/Obsidian Vault/7-templates/Requirements Template.md",
		},
	},
	filetypes = {
		markdown = "markdown",
	},
})
