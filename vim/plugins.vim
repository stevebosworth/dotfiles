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
  Plug 'djoshea/vim-autoread'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'itchyny/lightline.vim'
  " Plug 'maximbaz/lightline-ale'
  Plug 'kien/rainbow_parentheses.vim'
  Plug 'majutsushi/tagbar'
  Plug 'Konfekt/vim-alias'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'janko/vim-test'
  Plug 'thaerkh/vim-workspace'
  Plug 'Yggdroot/indentLine'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'github/copilot.vim'
  Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
  " -- Web Development
  Plug 'mattn/emmet-vim'
  " Plug 'hail2u/vim-css3-syntax'
  " Plug 'ap/vim-css-color'
  " Plug 'othree/html5.vim'
  " Plug 'briancollins/vim-jst'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-liquid'
  Plug 'nickng/vim-scribble'
  " Plug 'heavenshell/vim-jsdoc'
  " Plug 'pangloss/vim-javascript'
  " Plug 'peitalin/vim-jsx-typescript'
  " Plug 'leafgarland/typescript-vim'
  " Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  " Plug 'jparise/vim-graphql'
  " Plug 'cuducos/yaml.nvim'
endif

call plug#end()

" ---------------------- PLUGIN CONFIGURATION ----------------------

" ---------------------- NerdCommenter ----------------------
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" ---------------------- Ragtag Setup ----------------------
let g:ragtag_global_maps = 1

" ---------------------- IndentLine Setup ----------------------
" IndentLine hides quotes in JSON files
let g:vim_json_syntax_conceal = 0


" ---------------------- AutoPairs Setup ----------------------

" TODO: Remove if autopairs is not used
" let g:AutoPairsFlyMode = 0
" Jump outside '"({
" let g:AutoPairsShortcutJump = ''
" inoremap <c-l> :call AutoPairsShortcutJump()
"
" if !exists('g:AutoPairsShortcutJump')
" endif


" ---------------------- FZF Setup ----------------------
nnoremap <silent> <C-p> :call FZFOpen(':Files')<cr>
nnoremap <silent> <C-b> :call FZFOpen(':Buffers')<CR>

nnoremap <c-b> :Buffers<cr>
nnoremap <C-b> :Buffers<cr>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

function! FZFOpen(command_str)
  " Prevent fzf from opening a file in the nerd tree buffer
  " if (expand('%') =~# 'NERD_tree' && winnr('$') > 1)
  "   exe \"normal! \<c-w>\<c-w>"
  " endif
  exe 'normal! ' . a:command_str . "\<cr>"
endfunction

if executable('ag')
  "Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ackprg = 'ag --nogroup --nocolor --column --ignore-dir={node_modules,dist,.git,screenshots,.next}'
endif


" ---------------------- COC-Eplorer Setup ----------------------
" :nmap <C-n> <Cmd>CocCommand explorer<CR>

" ---------------------- ChadTree Setup ----------------------
:nmap <C-n> <Cmd>CHADopen<CR>

" ---------------------- Text find and replace Setup ----------------------
nnoremap <leader>a :Ack!<Space>

nnoremap <C-f> :Ack! "<C-R><C-W>"
vnoremap <C-f> :Ack! "<C-R><C-W>"

" ---------------------- Emmet Setup ----------------------
let g:user_emmet_leader_key = '<c-e>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

" ---------------------- COC Setup ----------------------
let g:coc_global_extensions = [
  \ 'coc-java',
  \ 'coc-css',
  \ 'coc-json',
  \ 'coc-html',
  \ 'coc-yaml',
  \ 'coc-snippets',
  \ 'coc-marketplace',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-stylelint',
  \ 'coc-prettier',
  \ 'coc-solargraph',
  \ 'coc-rls',
  \ 'coc-tailwindcss',
  \ ]

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Setup Prettier Command
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
" Go to definition in splits
" nmap <silent> gs :sp<CR><Plug>(coc-definition)
" nmap <silent> gv :vsp<CR><Plug>(coc-definition)

nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gc <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> sd :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" ---------------------- Ale Setup ----------------------
" TODO: Remove ale setup if it's not used
" let g:ale_fixers = {
"   \ 'javascript': ['prettier'],
"   \ 'css': ['stylelint'],
"   \ 'scss': ['stylelint'],
"   \ 'html': ['prettier'],
"   \ 'json': ['prettier']
"   \ }
" let g:ale_linters = {
"   \'ruby': ['rubocop'],
"   \ 'css': ['stylelint'],
"   \ 'scss': ['stylelint'],
"   \ }
" let g:ale_ruby_rubocop_executable = 'bundle'  "use local bundle exec version
" let g:ale_lint_on_text_changed = 0
" let g:ale_lint_on_enter = 0
" let g:ale_lint_on_save = 1
"
" let g:ale_sign_column_always = 1
" let g:ale_fix_on_save = 0
" let g:ale_javascript_prettier_use_local_config = 1
" let g:ale_linters_explicit = 1
"
" nmap <leader>d <Plug>(ale_fix)
" nmap <leader>l <Plug>(ale_lint)

" ---------------------- Vim Test ----------------------

" set test strategy for vim-test
let test#strategy = "dispatch"

nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

" ---------------------- Workspace Sessions ----------------------

let g:workspace_autocreate = 1
let g:workspace_session_directory = $HOME . '/.vim/sessions/'
let g:workspace_persist_undo_history = 1  " enabled = 1 (default), disabled = 0
let g:workspace_undodir= $HOME . '/.undodir/'

" ---------------------- Ctags ----------------------

nmap <leader>t :TagbarToggle<CR>

" ---------------------- Rainbow Parentheses Setup ----------------------
let g:rbpt_colorpairs = [
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 11
let g:rbpt_loadcmd_toggle = 0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" ---------------------- Better Whitespace ----------------------

let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

" ---------------------- Indent Guides ----------------------
let g:indentLine_conceallevel = 2
let g:indentLine_setConceal = 0

" ---------------------- LightLine ----------------------

let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename', 'cocstatus' ] ],
      \   'right': [ [ 'linter_errors', 'linter_warnings', 'linter_ok' ],
      \              [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_expand': {
      \   'linter_warnings': 'LightlineLinterWarnings',
      \   'linter_errors': 'LightlineLinterErrors',
      \   'linter_ok': 'LightlineLinterOK'
      \ },
      \ 'component_function': {
      \   'modified': 'MyModified',
      \   'readonly': 'MyReadonly',
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \   'cocstatus': 'coc#status',
      \ },
      \ 'component_type': {
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? ''._ : ''
  endif
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
endfunction

" always show lightline
set laststatus=2

