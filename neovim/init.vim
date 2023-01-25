if exists('g:vscode')
    " VSCode extension
else
endif

" Use ~/.vimrc for neovim
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
