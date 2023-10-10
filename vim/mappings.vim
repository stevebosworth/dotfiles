" ---------------------- KEY REMAPPING ----------------------

" use <C-Space> for Vim's keyword autocomplete
"  ...in the terminal
inoremap <Nul> <C-Space>
"  ...and in gui mode
inoremap <C-Space> <C-n>

" Use kj to exit insert mode
" inoremap kj <esc>
" cnoremap kj <esc>
" vnoremap kj <esc>

nmap <up> <nop>
nmap <down> <nop>
nmap <left> <nop>
nmap <right> <nop>

vmap <up> <nop>
vmap <down> <nop>
vmap <left> <nop>
vmap <right> <nop>

" FZF available commands
nnoremap <C-C> :Command<CR>
vnoremap <C-C> :Command<CR>

" Go to end of line and insert
inoremap <C-f> <C-o>A

" Add space in behind cursor
nnoremap ss i<space><esc>

" reset case switching
vmap u <nop>
vmap U <nop>

" Toggle between UPPER lower and Title case with ~ in visual mode
function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

nnoremap <C-b> :Buffers<CR>
nnoremap <leader>m :History<CR>

vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>

vnoremap //r "hy:%s/<C-r>h//g<left><left>
