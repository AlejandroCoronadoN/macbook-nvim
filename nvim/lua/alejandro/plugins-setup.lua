-- lua/alejandro/plugins-setup.lua

vim.o.conceallevel = 1
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	use("mbbill/undotree")
	use("wbthomason/packer.nvim")
	use("Mr-LLLLL/interestingwords.nvim")
	use("Blackmorse/highline.nvim")
	use("nvim-lua/plenary.nvim")
	use("bluz71/vim-nightfly-guicolors")
	use("ellisonleao/gruvbox.nvim")
	use("christoomey/vim-tmux-navigator")
	use("szw/vim-maximizer")
	use("azabiong/vim-highlighter")
	use("tpope/vim-surround")
	use("inkarkat/vim-ReplaceWithRegister")
	use("numToStr/Comment.nvim")
	use("nvim-tree/nvim-tree.lua")
	use("kyazdani42/nvim-web-devicons")
	use("nvim-lualine/lualine.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("lambdalisue/suda.vim")
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})
	use("jose-elias-alvarez/typescript.nvim")
	use("onsails/lspkind.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	use("windwp/nvim-autopairs")
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	use("theHamsta/nvim-dap-virtual-text")
	use({
		"mfussenegger/nvim-dap-python",
		requires = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
		},
	})
	use({
		"nvim-neotest/nvim-nio",
		requires = { "nvim-lua/plenary.nvim" },
	})

	use({
		"akinsho/bufferline.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	})

	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
	use("mhinz/vim-signify")

	use("RRethy/vim-illuminate")

	use({
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	})

	use({
		"github/copilot.vim",
	})
	use({
		"robitx/gp.nvim",
		config = function()
			require("gp").setup({
				openai_api_key = os.getenv("OPENAI_API_KEY"), -- Ensure you have your OpenAI API key set as an environment variable
			})
		end,
		requires = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	})

	use({
		"nvim-pack/nvim-spectre",
		requires = { "nvim-lua/plenary.nvim" },
	})

	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
	})

	use({
		"sindrets/diffview.nvim",
		requires = "nvim-lua/plenary.nvim",
	})

	use({
		"glepnir/dashboard-nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
	})
	use({ "epwalsh/obsidian.nvim", requires = { "nvim-lua/plenary.nvim" } })
	use({ "preservim/vim-markdown" })

	use("echasnovski/mini.nvim")
	-- use({ "jonmorehouse/vim-flow" })

	use({
		"vuki656/package-info.nvim",
		requires = "MunifTanjim/nui.nvim",
	})

	use({
		"jackMort/ChatGPT.nvim",
		config = function()
			require("chatgpt").setup({
				api_key = os.getenv("OPENAI_API_KEY"),
			})
		end,
		requires = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	})

	-- Add Codeium plugin
	use({
		"Exafunction/codeium.vim",
		config = function()
			-- Place any additional configuration for Codeium here
			vim.g.codeium_disable_bindings = 1 -- Disable default bindings to avoid conflicts
			-- Set your own keybindings for Codeium
			vim.api.nvim_set_keymap("i", "<C-g>", "codeium#Accept()", { expr = true, noremap = true, silent = true })
		end,
	})

	-- Parrot.nvim
	use({
		"frankroeder/parrot.nvim",
		tag = "v0.3.4",
		dependencies = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim" },
		config = function()
			require("alejandro.plugins.parrot") -- Load the parrot configuration
		end,
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
