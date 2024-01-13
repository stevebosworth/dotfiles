-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use {
    'NLKNguyen/papercolor-theme',
    as = 'papercolor',
    config = function()
      vim.opt.background = 'dark'
      vim.cmd('colorscheme papercolor')
    end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      --- Uncomment the two plugins below if you want to manage the language servers from neovim
      --- and read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- LSP Support
      {'neovim/nvim-lspconfig'},
      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-nvim-lua'},
      {'saadparwaiz1/cmp_luasnip'},
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }

  use 'lukas-reineke/indent-blankline.nvim'

  -- Config Files
  use 'Shatur/neovim-session-manager'
  use 'mbbill/undotree'
  use ('scrooloose/nerdcommenter') -- TODO: Add config
  use 'editorconfig/editorconfig-vim'
  use 'hiphish/rainbow-delimiters.nvim'
--  use 'janko/vim-test'
--  use 'Yggdroot/indentLine'
--  use 'christoomey/vim-tmux-navigator'
--  use 'mattn/emmet-vim'
  use { "alexghergh/nvim-tmux-navigation" }

  -- No config
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use 'tpope/vim-ragtag'
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-dispatch'
  use 'tpope/vim-eunuch'
  use 'github/copilot.vim'

end)
