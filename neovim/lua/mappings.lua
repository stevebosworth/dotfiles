-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

-----------------
-- Normal mode --
-----------------

-- Hint: see `:h vim.map.set()`
-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)
vim.keymap.set('n', '<esc>', ':noh<return><esc>', opts)
-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

--Reset bad keybindings
vim.keymap.set('v', 'u', '<nop>', opts)
vim.keymap.set('v', 'U', '<nop>', opts)
vim.keymap.set("n", "Q", "<nop>", opts)

-----------------
-- Visual mode --
-----------------

-- Copy to clipboard
vim.keymap.set('v', '<leader>y',  '"+y', opts)
vim.keymap.set('n', '<leader>Y',  '"+yg_', opts)
vim.keymap.set('n', '<leader>y',  '"+y', opts)
vim.keymap.set('n', '<leader>yy',  '"+yy', opts)

-- Paste from clipboard
vim.keymap.set('n', '<leader>p', '"+p', opts)
vim.keymap.set('n', '<leader>P', '"+P', opts)
vim.keymap.set('v', '<leader>p', '"+p', opts)
vim.keymap.set('v', '<leader>P', '"+P', opts)

-- Use ack for search
-- vim.keymap.set('n', '<leader>a', ':Ack<space>', opts)
-- vim.keymap.set('n', '<C-f>', ':Ack! "<C-R><C-W>"', opts)
-- vim.keymap.set('v', '<C-f>', ':Ack! "<C-R><C-W>"', opts)

-- Try out primegean's mappings

-- Move selected line / block of text in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

vim.keymap.set("n", "J", "mzJ`z", opts)

vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)

vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

vim.keymap.set("n", "n", "nzzzv", opts)

vim.keymap.set("n", "N", "Nzzzv", opts)

-- Set current buffer as executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Format current buffer
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Source current buffer
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
