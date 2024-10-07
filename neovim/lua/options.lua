-- Hint: use `:h <option>` to figure out the meaning if needed
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.opt.mouse = 'a'                 -- allow the mouse to be used in Nvim
vim.opt.selection = 'exclusive'     -- don't include the newline when yanking

-- Leader
vim.g.mapleader = ','             -- leader key

-- Folding
vim.opt.foldmethod = 'indent'       -- fold based on indent level
vim.opt.foldlevel = 20              -- open all folds by default

-- Tab
vim.opt.tabstop = 2                 -- number of visual spaces per TAB
vim.opt.softtabstop = 2             -- number of spacesin tab when editing
vim.opt.shiftwidth = 2              -- insert 2 spaces on a tab
vim.opt.expandtab = true            -- tabs are spaces, mainly because of python
vim.opt.autoindent = true           -- copy indent from current line when starting a new line
vim.opt.smartindent = true          -- smarter indentation for C-like languages

-- UI config
vim.opt.number = true               -- show absolute number
vim.opt.relativenumber = true       -- add numbers to each line on the left side
vim.opt.cursorline = true           -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true           -- open new vertical split bottom
vim.opt.splitright = true           -- open new horizontal splits right
vim.opt.termguicolors = true        -- enabl 24-bit RGB color in the TUI
vim.opt.scrolloff = 4               -- never have less than 4 lines visible
vim.opt.colorcolumn = '80'
vim.opt.guifont = 'UbuntuMono Nerd Font Mono'
vim.opt.updatetime = 50
vim.opt.signcolumn = 'auto:4'
vim.opt.wrap = true

-- Searching
vim.opt.incsearch = true            -- search as characters are entered
vim.opt.hlsearch = true             -- highlight matches
vim.opt.ignorecase = true           -- ignore case in searches by default
vim.opt.smartcase = true            -- but make it case sensitive if an uppercase is entered

local mygroup = vim.api.nvim_create_augroup('vimrc', { clear = true })
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '*.njk',
  group = mygroup,
  command = 'set syntax=html',
})
