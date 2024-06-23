-- lua/alejandro/core/autosplit.lua
  -- Function to close any window that contains a file that has already been opened by another window
  function _G.close_duplicate_windows(window_files)
    local seen_files = {}
  
    for _, wf in ipairs(window_files) do
      if seen_files[wf.file] then
        print("Closing duplicate window: " .. wf.win .. " - File: " .. wf.file)
        vim.api.nvim_win_close(wf.win, true)
        vim.cmd('silent! exec "bwipeout! ' .. vim.api.nvim_win_get_buf(wf.win) .. '"')

      else
        seen_files[wf.file] = true
      end
    end
  end


-- Function to open a new file in a vertical split
function _G.open_in_new_split(bufnr)


    -- Avoid running this during quit commands or for nvim-tree buffer
    if vim.v.event and vim.v.event.abort or vim.bo.filetype == "NvimTree" then
      return
    end

    -- Get the full path of the file being opened
    local new_file = vim.fn.expand('%:p', nil, bufnr)

    -- Check if the current buffer is a new file and not empty
    if vim.fn.expand('%:p') ~= '' and vim.bo.buftype == '' then
      -- Save the current buffer number
      local current_buf = vim.fn.bufnr('%')
      local current_file = vim.fn.expand('%:p')




      -- Open the new file in a new vertical split window
      vim.cmd('vsplit')
      
      -- Move back to the original buffer to keep it in the split
      vim.cmd('buffer ' .. current_buf)
      
      -- Move back to the new vertical split to be ready to open the new file
      vim.cmd('wincmd l')

      local windows = vim.api.nvim_list_wins()
      local window_files = {}
    
      for _, win in ipairs(windows) do
        local buf = vim.api.nvim_win_get_buf(win)
        local file = vim.api.nvim_buf_get_name(buf)
        table.insert(window_files, {win = win, file = file})
      end
    
      -- Print the lists
      print("Active windows: ")
      for _, win in ipairs(windows) do
          print("Window ID: " .. win)
      end
  
      print("Files in windows: ")
      for _, wf in ipairs(window_files) do
          print("Window ID: " .. wf.win .. " - File: " .. (wf.file ~= '' and wf.file or "No file"))
      end
      

    -- Check if the new split window buffer is the same as the current file
    local new_buf = vim.fn.bufnr('%')
    local new_file = vim.fn.expand('%:p')

    close_duplicate_windows(window_files)

    end
  end
  
-- Auto-command to trigger the function before opening a new file
vim.cmd([[
  augroup AutoOpenInNewSplit
    autocmd!
    autocmd BufReadPost * lua open_in_new_split(vim.fn.expand("<abuf>"))
  augroup END
]])