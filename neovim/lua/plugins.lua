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
    branch = 'master',  -- Pin to stable version to avoid v2 breaking changes
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

}

require("lazy").setup(plugins)
