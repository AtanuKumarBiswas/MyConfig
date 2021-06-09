if &compatible
    set nocompatible               " Be iMproved
endif

nnoremap <SPACE> <Nop>
let mapleader=" "
" Required:

filetype plugin indent on
" Only set syntax highlighting once!
if !exists("g:syntax_on")
    syntax enable
endif


call plug#begin()
source ~/.vim/config/plugins.vim
call plug#end()


source ~/.vim/config/compile.vim
source ~/.vim/config/keymap.vim
source ~/.vim/config/plug_key_maps.vim
source ~/.vim/config/set_value.vim
