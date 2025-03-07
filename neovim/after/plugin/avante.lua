require("avante").setup({
  -- Default configuration
  sidebar = {
    enable = true,
    width = 50,
    position = "right", -- "left" or "right"
    relative = "win",
    title = "Avante",
  },
  keymaps = {
    -- Default keymaps
    show_sidebar = "<leader>aa",
    refresh_sidebar = "<leader>ar",
    focus_sidebar = "<leader>af",
    edit_block = "<leader>ae",
  },
})
