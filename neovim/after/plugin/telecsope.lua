local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>a', function ()
  builtin.grep_string({ search = vim.fn.input("Grep For > ")})
end)
vim.keymap.set('v', '<leader>a', builtin.grep_string)
vim.keymap.set('n', '<C-b>', builtin.buffers, {})
vim.keymap.set('n', '<C-c>', builtin.commands, {})

local actions = require("telescope.actions")
require("telescope").setup{
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
	["<C-j>"] = actions.move_selection_next,
	["<C-k>"] = actions.move_selection_previous,
      },
    },
    file_ignore_patterns = {
      "node_modules"
    },
  }
}
