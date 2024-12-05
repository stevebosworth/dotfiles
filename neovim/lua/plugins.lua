-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Initialize lazy with plugins
local plugins = {
  -- Package Manager
  "folke/lazy.nvim",

  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- Theme
  {
    'hardhackerlabs/theme-vim',
    name = 'hardhacker',
    config = function()
      vim.opt.background = 'dark'
      vim.g.hardhacker_darker = 1
      vim.cmd('colorscheme hardhacker')
    end
  },

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },

  -- LSP
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v4.x',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
    }
  },

  -- File Explorer
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
  },

  -- Status Line
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },

  -- TypeScript Tools
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  },

  -- Config Files
  'Shatur/neovim-session-manager',
  'mbbill/undotree',
  'scrooloose/nerdcommenter',
  'editorconfig/editorconfig-vim',
  'hiphish/rainbow-delimiters.nvim',
  'mattn/emmet-vim',
  "alexghergh/nvim-tmux-navigation",

  -- Prettier
  'neovim/nvim-lspconfig',
  'nvimtools/none-ls.nvim',
  'MunifTanjim/prettier.nvim',

  -- No config needed
  'm4xshen/autoclose.nvim',
  'airblade/vim-gitgutter',
  'lukas-reineke/indent-blankline.nvim',
  'tpope/vim-fugitive',
  'tpope/vim-surround',
  'tpope/vim-ragtag',
  'tpope/vim-rhubarb',
  'tpope/vim-dispatch',
  'tpope/vim-eunuch',
  'github/copilot.vim',

  -- Trim whitespace
  {
    "cappyzawa/trim.nvim",
    config = function()
      require("trim").setup({
        ft_blocklist = { "markdown" },
        patterns = {
          [[%s/\(\n\n\)\n\+/\1/]],
        },
      })
    end
  },

  -- Ultimate Autopair
  {
    'altermo/ultimate-autopair.nvim',
    event = { 'InsertEnter', 'CmdlineEnter' },
    branch = 'v0.6',
    opts = {},
  },

  -- Tabout
  {
    'abecodes/tabout.nvim',
    dependencies = { 'nvim-treesitter', 'nvim-cmp' },
    config = function()
      require('tabout').setup {
        tabkey = '<Tab>',
        backwards_tabkey = '<S-Tab>',
        act_as_tab = true,
        act_as_shift_tab = false,
        default_tab = '<C-t>',
        default_shift_tab = '<C-d>',
        enable_backwards = true,
        completion = true,
        tabouts = {
          { open = "'", close = "'" },
          { open = '"', close = '"' },
          { open = '`', close = '`' },
          { open = '(', close = ')' },
          { open = '[', close = ']' },
          { open = '{', close = '}' }
        },
        ignore_beginning = true,
        exclude = {}
      }
    end,
  },

  -- Avante - AI Code Assistant
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- latest changes
    build = "make",
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "hrsh7th/nvim-cmp",
      "nvim-tree/nvim-web-devicons",
      "zbirenbaum/copilot.lua",
      {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            use_absolute_path = true,
          },
        },
      },
      {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}

require("lazy").setup(plugins)
