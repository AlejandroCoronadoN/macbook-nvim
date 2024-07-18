-- Set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness
-- Call the function to ensure it prints

---------------------
-- General Keymaps
---------------------

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

keymap.set("n", "<CR>", ":Hi><CR>") -- go to previous tab
keymap.set("n", "g<CR>", ":Hi<<CR>") -- go to previous tab
keymap.set("n", "[<CR>", ":Hi<<CR>") -- go to previous tab
keymap.set("n", "]<CR>", ":Hi><CR>") -- go to previous tab

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
-- Function to search selected text with Telescope
_G.search_selection = function()
	-- Yank the selected text into the 'v' register
	vim.cmd('normal! "vy')
	local search_term = vim.fn.getreg("v")
	-- Execute Telescope grep_string with the selected text
	require("telescope.builtin").grep_string({ search = search_term })
end

vim.api.nvim_set_keymap("v", "<leader>fs", "<cmd>lua _G.search_selection()<CR>", { noremap = true, silent = true })
-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>tc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>tfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>tb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>ts", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

----------------------
-- Debugger Keybinds
----------------------

-- Toggle Breakpoint
keymap.set("n", "<C-h>b", ":lua require'dap'.toggle_breakpoint()<CR>")

-- Continue
keymap.set("n", "<C-h>c", ":lua require'dap'.continue()<CR>")

-- Step Over
keymap.set("n", "<C-h>o", ":lua require'dap'.step_over()<CR>")

-- Step Into
keymap.set("n", "<C-h>i", ":lua require'dap'.step_into()<CR>")

-- Step Out
keymap.set("n", "<C-h>u", ":lua require'dap'.step_out()<CR>")

-- Terminate
keymap.set("n", "<C-h>t", ":lua require'dap'.terminate()<CR>")

-- Keybindings for dap-ui
vim.keymap.set("n", "<leader>dui", function()
	require("dapui").toggle()
end)

----------------------
-- Bufferline Keybinds
----------------------

vim.api.nvim_set_keymap("n", "<Leader>bn", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>bp", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>bd", ":bdelete<CR>", { noremap = true, silent = true })

-- Define key mapping options
local function keymapOptions(desc)
	return {
		noremap = true,
		silent = true,
		nowait = true,
		desc = "GPT prompt " .. desc,
	}
end

-- Chat commands
vim.keymap.set({ "n", "i" }, "<C-g>c", "<cmd>GpChatNew<cr>", keymapOptions("New Chat"))
vim.keymap.set({ "n", "i" }, "<C-g>t", "<cmd>GpChatToggle<cr>", keymapOptions("Toggle Chat"))
vim.keymap.set({ "n", "i" }, "<C-g>f", "<cmd>GpChatFinder<cr>", keymapOptions("Chat Finder"))

vim.keymap.set("v", "<C-g>c", ":<C-u>'<,'>GpChatNew<cr>", keymapOptions("Visual Chat New"))
vim.keymap.set("v", "<C-g>p", ":<C-u>'<,'>GpChatPaste<cr>", keymapOptions("Visual Chat Paste"))
vim.keymap.set("v", "<C-g>t", ":<C-u>'<,'>GpChatToggle<cr>", keymapOptions("Visual Toggle Chat"))

vim.keymap.set({ "n", "i" }, "<C-g><C-x>", "<cmd>GpChatNew split<cr>", keymapOptions("New Chat split"))
vim.keymap.set({ "n", "i" }, "<C-g><C-v>", "<cmd>GpChatNew vsplit<cr>", keymapOptions("New Chat vsplit"))
vim.keymap.set({ "n", "i" }, "<C-g><C-t>", "<cmd>GpChatNew tabnew<cr>", keymapOptions("New Chat tabnew"))

vim.keymap.set("v", "<C-g><C-x>", ":<C-u>'<,'>GpChatNew split<cr>", keymapOptions("Visual Chat New split"))
vim.keymap.set("v", "<C-g><C-v>", ":<C-u>'<,'>GpChatNew vsplit<cr>", keymapOptions("Visual Chat New vsplit"))
vim.keymap.set("v", "<C-g><C-t>", ":<C-u>'<,'>GpChatNew tabnew<cr>", keymapOptions("Visual Chat New tabnew"))

-- Prompt commands
vim.keymap.set({ "n", "i" }, "<C-g>r", "<cmd>GpRewrite<cr>", keymapOptions("Inline Rewrite"))
vim.keymap.set({ "n", "i" }, "<C-g>a", "<cmd>GpAppend<cr>", keymapOptions("Append (after)"))
vim.keymap.set({ "n", "i" }, "<C-g>b", "<cmd>GpPrepend<cr>", keymapOptions("Prepend (before)"))

vim.keymap.set("v", "<C-g>r", ":<C-u>'<,'>GpRewrite<cr>", keymapOptions("Visual Rewrite"))
vim.keymap.set("v", "<C-g>a", ":<C-u>'<,'>GpAppend<cr>", keymapOptions("Visual Append (after)"))
vim.keymap.set("v", "<C-g>b", ":<C-u>'<,'>GpPrepend<cr>", keymapOptions("Visual Prepend (before)"))
vim.keymap.set("v", "<C-g>i", ":<C-u>'<,'>GpImplement<cr>", keymapOptions("Implement selection"))

vim.keymap.set({ "n", "i" }, "<C-g>gp", "<cmd>GpPopup<cr>", keymapOptions("Popup"))
vim.keymap.set({ "n", "i" }, "<C-g>ge", "<cmd>GpEnew<cr>", keymapOptions("GpEnew"))
vim.keymap.set({ "n", "i" }, "<C-g>gn", "<cmd>GpNew<cr>", keymapOptions("GpNew"))
vim.keymap.set({ "n", "i" }, "<C-g>gv", "<cmd>GpVnew<cr>", keymapOptions("GpVnew"))
vim.keymap.set({ "n", "i" }, "<C-g>gt", "<cmd>GpTabnew<cr>", keymapOptions("GpTabnew"))

vim.keymap.set("v", "<C-g>gp", ":<C-u>'<,'>GpPopup<cr>", keymapOptions("Visual Popup"))
vim.keymap.set("v", "<C-g>ge", ":<C-u>'<,'>GpEnew<cr>", keymapOptions("Visual GpEnew"))
vim.keymap.set("v", "<C-g>gn", ":<C-u>'<,'>GpNew<cr>", keymapOptions("Visual GpNew"))
vim.keymap.set("v", "<C-g>gv", ":<C-u>'<,'>GpVnew<cr>", keymapOptions("Visual GpVnew"))
vim.keymap.set("v", "<C-g>gt", ":<C-u>'<,'>GpTabnew<cr>", keymapOptions("Visual GpTabnew"))

vim.keymap.set({ "n", "i" }, "<C-g>x", "<cmd>GpContext<cr>", keymapOptions("Toggle Context"))
vim.keymap.set("v", "<C-g>x", ":<C-u>'<,'>GpContext<cr>", keymapOptions("Visual Toggle Context"))

vim.keymap.set({ "n", "i", "v", "x" }, "<C-g>s", "<cmd>GpStop<cr>", keymapOptions("Stop"))
vim.keymap.set({ "n", "i", "v", "x" }, "<C-g>n", "<cmd>GpNextAgent<cr>", keymapOptions("Next Agent"))

-- Optional Whisper commands with prefix <C-g>w
vim.keymap.set({ "n", "i" }, "<C-g>ww", "<cmd>GpWhisper<cr>", keymapOptions("Whisper"))
vim.keymap.set("v", "<C-g>ww", ":<C-u>'<,'>GpWhisper<cr>", keymapOptions("Visual Whisper"))

vim.keymap.set({ "n", "i" }, "<C-g>wr", "<cmd>GpWhisperRewrite<cr>", keymapOptions("Whisper Inline Rewrite"))
vim.keymap.set({ "n", "i" }, "<C-g>wa", "<cmd>GpWhisperAppend<cr>", keymapOptions("Whisper Append (after)"))
vim.keymap.set({ "n", "i" }, "<C-g>wb", "<cmd>GpWhisperPrepend<cr>", keymapOptions("Whisper Prepend (before) "))

vim.keymap.set("v", "<C-g>wr", ":<C-u>'<,'>GpWhisperRewrite<cr>", keymapOptions("Visual Whisper Rewrite"))
vim.keymap.set("v", "<C-g>wa", ":<C-u>'<,'>GpWhisperAppend<cr>", keymapOptions("Visual Whisper Append (after)"))
vim.keymap.set("v", "<C-g>wb", ":<C-u>'<,'>GpWhisperPrepend<cr>", keymapOptions("Visual Whisper Prepend (before)"))

vim.keymap.set({ "n", "i" }, "<C-g>wp", "<cmd>GpWhisperPopup<cr>", keymapOptions("Whisper Popup"))
vim.keymap.set({ "n", "i" }, "<C-g>we", "<cmd>GpWhisperEnew<cr>", keymapOptions("Whisper Enew"))
vim.keymap.set({ "n", "i" }, "<C-g>wn", "<cmd>GpWhisperNew<cr>", keymapOptions("Whisper New"))
vim.keymap.set({ "n", "i" }, "<C-g>wv", "<cmd>GpWhisperVnew<cr>", keymapOptions("Whisper Vnew"))
vim.keymap.set({ "n", "i" }, "<C-g>wt", "<cmd>GpWhisperTabnew<cr>", keymapOptions("Whisper Tabnew"))

vim.keymap.set("v", "<C-g>wp", ":<C-u>'<,'>GpWhisperPopup<cr>", keymapOptions("Visual Whisper Popup"))
vim.keymap.set("v", "<C-g>we", ":<C-u>'<,'>GpWhisperEnew<cr>", keymapOptions("Visual Whisper Enew"))
vim.keymap.set("v", "<C-g>wn", ":<C-u>'<,'>GpWhisperNew<cr>", keymapOptions("Visual Whisper New"))
vim.keymap.set("v", "<C-g>wv", ":<C-u>'<,'>GpWhisperVnew<cr>", keymapOptions("Visual Whisper Vnew"))
vim.keymap.set("v", "<C-g>wt", ":<C-u>'<,'>GpWhisperTabnew<cr>", keymapOptions("Visual Whisper Tabnew"))

----------------------
-- Spectre Keybinds
----------------------
-- Configure nvim-spectre keybindings with cmd key
vim.api.nvim_set_keymap("n", "<C-S-f>", ":lua require('spectre').open()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-S-f>", ":lua require('spectre').open_visual()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-S-y>", ":lua require('spectre').open()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-S-y>", ":lua require('spectre').open_visual()<CR>", { noremap = true, silent = true })

----------------------
-- ToggleTerm Keybinds
-- Keybindings (example)
vim.api.nvim_set_keymap("n", "<leader>o", ":ObsidianOpen<CR>", { noremap = true, silent = true })
----------------------
-- Configure toggleterm keybindings
vim.api.nvim_set_keymap("n", "<PageDown>", ":ToggleTerm<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<PageDown>", "<C-\\><C-n>:ToggleTerm<CR>", { noremap = true, silent = true })

----------------------
-- Diffview Keybinds
----------------------
-- Configure diffview keybindings
vim.api.nvim_set_keymap("n", "<leader>dv", ":DiffviewOpen<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>dc", ":DiffviewClose<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>dh", ":DiffviewFileHistory<CR>", { noremap = true, silent = true })

----------------------
-- Template Keybinds
----------------------
-- Sample keybindings to apply templates
vim.api.nvim_set_keymap("n", "<leader>tb", ":Template markdown basic<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ta", ":Template markdown advanced<CR>", { noremap = true, silent = true })

----------------------
-- Obsidian Keybinds
------------------------
vim.api.nvim_set_keymap("n", "<leader>o", ":ObsidianOpen<CR>", { noremap = true, silent = true })

----------------------
-- GPT Keybinds
------------------------
vim.api.nvim_set_keymap("n", "<leader>ca", ":ChatGPTActAs<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>cc", ":ChatGPTCompleteCode<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ce", ":ChatGPTEditWithInstructions<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>cr", ":ChatGPTRun<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>cr", ":'<,'>ChatGPTRun<CR>", { noremap = true, silent = true })
-- List Keymaps
keymap.set("n", "<leader>ll", ":TelescopeKeymaps<CR>")

----------------------
-- Parrot Keybinds
------------------------

-- Set key bindings for Parrot.nvim hooks
vim.api.nvim_set_keymap("n", "<leader>pn", ":PrtNew<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>pp", ":PrtProvider openai<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>pa", ":PrtAsk<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>pi", ":PrtImplement<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>pc", ":PrtChatToggle<CR>", { noremap = true, silent = true })

-- Keybindings to trigger the hooks in visual mode
vim.api.nvim_set_keymap(
	"v",
	"<leader>pr",
	[[:lua require('parrot').hooks.RefactorCode({
    params = {
        start_line = vim.fn.line("'<"),
        end_line = vim.fn.line("'>"),
        start_col = vim.fn.col("'<"),
        jonsole.log("params", params),
        end_col = vim.fn.col("'>"),
    }
})<CR>]],
	{ noremap = true, silent = true }
)

-- Set up keybinding for DescribeFile function
vim.api.nvim_set_keymap(
	"n",
	"<leader>df",
	':lua require("parrot").hooks.DescribeFile(require("parrot"), {})<CR>',
	{ noremap = true, silent = true }
)
