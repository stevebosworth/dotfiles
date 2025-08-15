local builtin = require('telescope.builtin')

-- Custom find_files function that includes hidden files
local function find_files_with_hidden()
  builtin.find_files({
    hidden = true,
    no_ignore = true,
    file_ignore_patterns = {
      "^%.git/",
      "node_modules/",
      "%.git/.*",
      "node_modules/.*",
    }
  })
end

vim.keymap.set('n', '<C-p>', find_files_with_hidden, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>g', function()
  builtin.grep_string({ search = vim.fn.input("Grep For > ") })
end)
vim.keymap.set('v', '<leader>f', builtin.grep_string)
vim.keymap.set('n', '<C-b>', builtin.buffers, {})
vim.keymap.set('n', '<C-c>', builtin.commands, {})

local actions = require("telescope.actions")
require("telescope").setup {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--follow",        -- Follow symbolic links
      "--hidden",        -- Search for hidden files
      "--no-heading",    -- Don't group matches by each file
      "--with-filename", -- Print the file path with the matched lines
      "--line-number",   -- Show line numbers
      "--column",        -- Show column numbers
      "--smart-case",    -- Smart case search

      -- Exclude some patterns from search
      "--glob=!.git/**",
      "--glob=!**/node_modules/**",
    },
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  },
}
