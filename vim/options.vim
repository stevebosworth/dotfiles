" don't make vim compatible with vi
set nocompatible

" set filetype off for now
filetype off

" and show line numbers
set number

" reload files changed outside vim
set autoread

" encoding is utf 8
set encoding=utf-8
set fileencoding=utf-8

" enable matchit plugin which ships with vim and greatly enhances '%'
runtime macros/matchit.vim

" by default, in insert mode backspace won't delete over line breaks, or
" automatically-inserted indentation, let's change that
set backspace=indent,eol,start

" dont't unload buffers when they are abandoned, instead stay in the
" background
set hidden

" set unix line endings
set fileformat=unix
" when reading files try unix line endings then dos, also use unix for new
" buffers
set fileformats=unix,dos

" save up to 100 marks, enable capital marks
set viminfo='100,f1

" case sensitivity
set ignorecase
set smartcase

" screen will not be redrawn while running macros, registers or other
" non-typed comments
set lazyredraw

" allow scrolling with the mouse
set mouse=a

" Allow project specific vimrc
set exrc

" set python version for neovim
let g:python3_host_prog = $PYTHON3_PATH


" ---------------------- CUSTOMIZATION ----------------------
"  The following are some extra mappings/configs to enhance my personal
"  VIM experience

" set , as mapleader
let mapleader = ","


" hide unnecessary gui in gVim
if has("gui_running")
  set guioptions-=m  " remove menu bar
  set guioptions-=T  " remove toolbar
  set guioptions-=r  " remove right-hand scroll bar
  set guioptions-=L  " remove left-hand scroll bar
end

" set Ubuntu Mono font as default
set guifont=Ubuntu\ Mono\ derivative\ Powerline:h15
" allow Tab and Shift+Tab to
" tab  selection in visual mode
vmap <Tab> >gv
vmap <S-Tab> <gv

" remove the .ext~ files, but not the swapfiles
set nobackup
set writebackup
set noswapfile

" search settings
set incsearch        " find the next match as we type the search
set hlsearch         " hilight searches by default
" use ESC to remove search higlight
nnoremap <esc> :noh<return><esc>

" suggestion for normal mode commands
set wildmode=list:longest

" keep the cursor visible within 3 lines when scrolling
set scrolloff=3

" indentation
set tabstop=2       " tabs are 2 spaces
set expandtab       " use spaces instead of tabs
set autoindent      " autoindent based on line above, works most of the time
set smartindent     " smarter indent for C-like languages
set shiftwidth=2    " when reading, tabs are 2 spaces
set softtabstop=2   " in insert mode, tabs are 2 spaces

" On file types...
"   .md files are markdown files
autocmd BufNewFile,BufRead *.md setlocal ft=markdown tw=80 formatoptions+=t
"   .twig files use html syntax
autocmd BufNewFile,BufRead *.twig setlocal ft=html
"   .less files use less syntax
autocmd BufNewFile,BufRead *.less setlocal ft=less
"   .jade files use jade syntax
autocmd BufNewFile,BufRead *.jade setlocal ft=jade
"   .js.liquid files use .js.liquid syntax
autocmd BufNewFile,BufRead *.js.liquid setlocal ft=JavaScript
"   .scss files use scss syntax
autocmd BufNewFile,BufRead *.scss.liquid setlocal ft=scss
"   Guardfile files use ruby syntax
autocmd BufNewFile,BufRead Guardfile setlocal ft=ruby
" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

au BufNewFile,BufRead *.py
    \ setlocal ft=python3
    \ setlocal tabstop=4
    \ setlocal softtabstop=4
    \ setlocal shiftwidth=4
    \ setlocal textwidth=79
    \ setlocal fileformat=unix

" Reload Syntax for TS and JS file
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

"Python Dev Setup
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" enable proper syntax highlighting in markdown code blocks
let g:markdown_fenced_languages = ['html', 'python', 'ruby', 'vim', 'javascript', 'css']

" when pasting over SSH it's a pain to type :set paste and :set nopaste
" just map it to <f9>
"set pastetoggle=<f9>

" if windows...
if has('win32')
  " start maximized
  autocmd GUIEnter * simalt ~x
  " also use .vim instead of vimfiles, make sure to run the following command
  " once this was copied to /Users/<user>/.vim
  "  mklink %homepath%/.vimrc %homepath%/.vim/.vimrc
  let &runtimepath.=',$HOME/.vim'
endif

" turn on syntax highlighting
syntax enable

" make vim try to detect file types and load plugins for them
filetype on
filetype plugin on
filetype indent on

"auto resize windows
autocmd VimResized * wincmd =

"Show trailing whitespaces
set list listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:-,trail:-

" make a mark for column 80
" and set the mark color to DarkSlateGray
if exists('+colorcolumn')
  set colorcolumn=120
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

"Set different cursors for insert and commmand modes
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q""]"

"Set folding to indent by default
set foldmethod=indent
set foldlevel=20

set selection=exclusive

augroup myvimrc
  au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END


" Autoload .vimrc
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }


" set secure to protect project specific vimrc
set secure
