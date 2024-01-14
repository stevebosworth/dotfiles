" Install vim-plug if not installed already
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" start plugin defintion

if exists('g:vscode')
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-surround'
  Plug 'preservim/nerdcommenter'
else
  Plug 'lambdalisue/fern.vim'
  Plug 'hrsh7th/fern-mapping-call-function.vim'
  Plug 'lambdalisue/fern-git-status.vim'
  Plug 'vim-scripts/L9'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-ragtag'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-eunuch'
  Plug 'scrooloose/nerdcommenter'
  Plug 'airblade/vim-gitgutter'
  Plug 'jiangmiao/auto-pairs'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'mileszs/ack.vim'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'hardhackerlabs/theme-vim', { 'as': 'hardhacker'
  " automatically reload files changed outside vim
  Plug 'djoshea/vim-autoread'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'itchyny/lightline.vim'
  Plug 'kien/rainbow_parentheses.vim'
  Plug 'Konfekt/vim-alias'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'janko/vim-test'
  Plug 'thaerkh/vim-workspace'
  Plug 'Yggdroot/indentLine'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'github/copilot.vim'
  " -- Web Development
  Plug 'mattn/emmet-vim'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-liquid'
endif

call plug#end()

" ---------------------- PLUGIN CONFIGURATION ----------------------

source $ZSH/vim/mappings.vim
source $ZSH/vim/plugins/nerdcommenter.vim
" TODO: Remove if autopairs is not used
" source /plugins/autopairs.vim
source $ZSH/vim/plugins/fzf.vim
source $ZSH/vim/plugins/emmet.vim
source $ZSH/vim/plugins/coc.vim
source $ZSH/vim/plugins/fern.vim
" source $ZSH/vim/plugins/nerdtree.vim
" source $ZSH/vim/plugins/ale.vim
source $ZSH/vim/plugins/vimtest.vim
source $ZSH/vim/plugins/rainbowparentheses.vim
source $ZSH/vim/plugins/workspace.vim
source $ZSH/vim/plugins/betterwhitespace.vim
source $ZSH/vim/plugins/indentguides.vim
source $ZSH/vim/plugins/lightline.vim
