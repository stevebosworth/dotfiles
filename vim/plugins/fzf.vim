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


