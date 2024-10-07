local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use {
    'hardhackerlabs/theme-vim',
    as = 'hardhacker',
    config = function()
      vim.opt.background = 'dark'
      vim.g.hardhacker_darker = 1
      vim.cmd('colorscheme hardhacker')
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
      {'hrsh7th/cmp-nvim-lua'},
      {'saadparwaiz1/cmp_luasnip'},
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
      -- Prettier
      {'jose-elias-alvarez/null-ls.nvim'},
      {'MunifTanjim/prettier.nvim'},
    }
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- Config Files
  -- use 'Shatur/neovim-session-manager'
  use 'mbbill/undotree'
  use ('scrooloose/nerdcommenter')
  use 'editorconfig/editorconfig-vim'
  use 'hiphish/rainbow-delimiters.nvim'
--  use 'janko/vim-test'
  use 'mattn/emmet-vim'
  use { "alexghergh/nvim-tmux-navigation" }

  -- No config
  use 'm4xshen/autoclose.nvim'
  use 'airblade/vim-gitgutter'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use 'tpope/vim-ragtag'
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-dispatch'
  use 'tpope/vim-eunuch'
  use 'github/copilot.vim'

  -- Inline Config

  -- remove trailing whitespace
  use({
    "cappyzawa/trim.nvim",
    config = function()
      require("trim").setup({
        -- if you want to ignore markdown file.
        -- you can specify filetypes.
        ft_blocklist = {"markdown"},

        -- if you want to remove multiple blank lines
        -- replace multiple blank lines with a single line
        patterns = {
          [[%s/\(\n\n\)\n\+/\1/]],
        },
      })
    end
  })

  use{
    'altermo/ultimate-autopair.nvim',
    event={'InsertEnter','CmdlineEnter'},
    branch='v0.6', --recomended as each new version will have breaking changes
    config=function ()
      require('ultimate-autopair').setup({
        --Config goes here
      })
    end,
  }

  use {
    'abecodes/tabout.nvim',
    config = function()
      require('tabout').setup {
        tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
        backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
        act_as_tab = true, -- shift content if tab out is not possible
        act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
        default_tab = '<C-t>', -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
        default_shift_tab = '<C-d>', -- reverse shift default action,
        enable_backwards = true, -- well ...
        completion = true, -- if the tabkey is used in a completion pum
        tabouts = {
          {open = "'", close = "'"},
          {open = '"', close = '"'},
          {open = '`', close = '`'},
          {open = '(', close = ')'},
          {open = '[', close = ']'},
          {open = '{', close = '}'}
        },
        ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
        exclude = {} -- tabout will ignore these filetypes
      }
    end,
    wants = {'nvim-treesitter'}, -- or require if not used so far
    after = {'nvim-cmp'} -- if a completion plugin is using tabs load it before
  }
end)
