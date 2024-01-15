vim.keymap.set('i', '<C-a>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})
