require("avante").setup({
  -- Default configuration
  sidebar = {
    enable = true,
    width = 50,
    position = "right", -- "left" or "right"
    relative = "win",
    title = "Avante",
  },
  provider = "ollama",
  vendors = {
    ollama = {
      __inherited_from = "openai",
      api_key_name = "",
      endpoint = "http://127.0.0.1:11434/v1",
      model = "codellama",
    },
  },
  keymaps = {
    -- Default keymaps
    show_sidebar = "<leader>aa",
    refresh_sidebar = "<leader>ar",
    focus_sidebar = "<leader>af",
    edit_block = "<leader>ae",
  },
})
