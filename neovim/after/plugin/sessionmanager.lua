local Path = require('plenary.path')
local config_group = vim.api.nvim_create_augroup('MyConfigGroup', {}) -- A global group for all your config autocommands
local config = require('session_manager.config')
local session_manager = require('session_manager')

require('session_manager').setup({
  sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'),
  autoload_mode = config.AutoloadMode.CurrentDir, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
  autosave_last_session = true,                   -- Automatically save last session on exit and on session switch.
  autosave_ignore_not_normal = true,              -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
  autosave_ignore_dirs = {},                      -- A list of directories where the session will not be autosaved.
  autosave_ignore_filetypes = {                   -- All buffers of these file types will be closed before the session is saved.
    'gitcommit',
    'gitrebase',
  },
  autosave_ignore_buftypes = {},    -- All buffers of these bufer types will be closed before the session is saved.
  autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
  max_path_length = 80,             -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
})

-- Silently handle session load errors
vim.api.nvim_create_autocmd({ 'User' }, {
  pattern = "SessionLoadPost",
  group = config_group,
  callback = function()
    pcall(function()
      require('nvim-tree.api').tree.toggle(false, true)
    end)
  end,
})

-- Auto save session
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  callback = function()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      -- Don't save while there's any 'nofile' buffer open.
      if vim.api.nvim_get_option_value("buftype", { buf = buf }) == 'nofile' then
        return
      end
    end
    pcall(session_manager.save_current_session)
  end
})
