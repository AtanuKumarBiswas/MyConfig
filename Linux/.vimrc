syntax on
set noerrorbells
set tabstop=4 softtabstop=4
set smartindent
set smarttab
set autoindent
set tw=80
set cindent
set shiftwidth=4
set expandtab
set nu
set relativenumber
set ruler
set guifont=*
set backspace=indent,eol,start
set clipboard=unnamedplus

set complete+=kspell
set completeopt=menuone,longest

" eggcache vim
nnoremap ; :
:command W w
:command WQ wq
:command Wq wq
:command Q q
:command Qa qa
:command QA qa

" insert line bellow (capital O) or above (small o) and then go to normal mode
":nnoremap o o<Esc>
":nnoremap O O<Esc>

"auto closing"

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""compiling""""""""""""""""""""""""""""""""
autocmd filetype c nnoremap <F4> :w <bar> exec "!gcc -std=c11 % -lm -lcs50 && ./a.out"<CR>
map <F5> :call CompileRun()<CR>
func! CompileRun()
exec "w"
if &filetype == 'c'
	exec "!gcc -std=c11 % -lm -lcs50 && ./a.out && rm a.out"	
elseif &filetype == 'cpp'
	exec "!g++ -std=c++11 -Wall % -lm && a.out  && rm a.out"
elseif &filetype == 'java'
	exec "!javac % && java -cp %:p:h %:t:r && rm *.class"
elseif &filetype == 'sh'
	exec "!time bash %"
elseif &filetype == 'python'
	exec "!python3 %"
elseif &filetype == 'html'
	exec "!firefox % &"
elseif &filetype == 'go'
	exec "!go build %<"
	exec "!time go run %"
elseif &filetype == 'mkd'
	exec "!~/.vim/markdown.pl % > %.html &"
	exec "!firefox %.html &"
endif
exec "!clear"
endfunc
"WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system('cat |' . s:clip, @0) | endif
    augroup END
endif

nnoremap <C-Right> :tabnext<CR>
nnoremap <C-Left> :tabprevious<CR>
"autocmd filetype cpp nnoremap <F5> :w <bar> !g++ -std=c++17 -O2 -Wall % -o %:r && %:r.exe <CR>
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
" Plugin 'ycm-core/YouCompleteMe'
Plugin 'gruvbox-community/gruvbox'
Plugin 'vim-utils/vim-man'
Plugin 'sainnhe/gruvbox-material'
Plugin 'phanviet/vim-monokai-pro'
Plugin 'vim-airline/vim-airline'
Plugin 'flazz/vim-colorschemes'
Plugin 'ajh17/VimCompletesMe'
Plugin 'tomtom/tcomment_vim'
Plugin 'maralla/completor.vim'
Plugin 'preservim/tagbar'
Plugin 'preservim/nerdtree'
Plugin 'powerline/powerline'
Plugin 'ap/vim-templates'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
""let g:clang_library_path='/usr/lib/llvm-10/lib'
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
":PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

" --- The Greatest plugin of all time.  I am not bias
" let g:vim_be_good_floating = 0

" --- vim go (polyglot) settings.
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1

colorscheme gruvbox
set background=dark
"Template"
" :autocmd BufNewFile *.c 0r ~/.vim/templates/template.c 
" :autocmd BufNewFile *.cpp 0r ~/.vim/templates/template.cpp
" :autocmd BufNewFile *.sh 0r ~/.vim/templates/template.sh

"g:templates_empty_files = 1
"Split buffer"
set splitbelow splitright
" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

" Removes pipes | that act as seperators on splits
set fillchars+=vert:\ 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Theming
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight LineNr           ctermfg=8    ctermbg=none    cterm=none
highlight CursorLineNr     ctermfg=7    ctermbg=8       cterm=none
highlight VertSplit        ctermfg=0    ctermbg=8       cterm=none
highlight Statement        ctermfg=2    ctermbg=none    cterm=none
highlight Directory        ctermfg=4    ctermbg=none    cterm=none
highlight StatusLine       ctermfg=7    ctermbg=8       cterm=none
highlight StatusLineNC     ctermfg=7    ctermbg=8       cterm=none
highlight NERDTreeClosable ctermfg=2
highlight NERDTreeOpenable ctermfg=8
highlight Comment          ctermfg=4    ctermbg=none    cterm=italic
highlight Constant         ctermfg=12   ctermbg=none    cterm=none
highlight Special          ctermfg=4    ctermbg=none    cterm=none
highlight Identifier       ctermfg=8    ctermbg=none    cterm=none
highlight PreProc          ctermfg=5    ctermbg=none    cterm=none
highlight String           ctermfg=12   ctermbg=none    cterm=none
highlight Number           ctermfg=3    ctermbg=none    cterm=none
highlight Function         ctermfg=1    ctermbg=none    cterm=none
" highlight WildMenu         ctermfg=0       ctermbg=80      cterm=none
" highlight Folded           ctermfg=103     ctermbg=234     cterm=none
" highlight FoldColumn       ctermfg=103     ctermbg=234     cterm=none
" highlight DiffAdd          ctermfg=none    ctermbg=23      cterm=none
" highlight DiffChange       ctermfg=none    ctermbg=56      cterm=none
" highlight DiffDelete       ctermfg=168     ctermbg=96      cterm=none
" highlight DiffText         ctermfg=0       ctermbg=80      cterm=none
" highlight SignColumn       ctermfg=244     ctermbg=235     cterm=none
" highlight Conceal          ctermfg=251     ctermbg=none    cterm=none
" highlight SpellBad         ctermfg=168     ctermbg=none    cterm=underline
" highlight SpellCap         ctermfg=80      ctermbg=none    cterm=underline
" highlight SpellRare        ctermfg=121     ctermbg=none    cterm=underline
" highlight SpellLocal       ctermfg=186     ctermbg=none    cterm=underline
" highlight Pmenu            ctermfg=251     ctermbg=234     cterm=none
" highlight PmenuSel         ctermfg=0       ctermbg=111     cterm=none
" highlight PmenuSbar        ctermfg=206     ctermbg=235     cterm=none
" highlight PmenuThumb       ctermfg=235     ctermbg=206     cterm=none
" highlight TabLine          ctermfg=244     ctermbg=234     cterm=none
" highlight TablineSel       ctermfg=0       ctermbg=247     cterm=none
" highlight TablineFill      ctermfg=244     ctermbg=234     cterm=none
" highlight CursorColumn     ctermfg=none    ctermbg=236     cterm=none
" highlight CursorLine       ctermfg=none    ctermbg=236     cterm=none
" highlight ColorColumn      ctermfg=none    ctermbg=236     cterm=none
" highlight Cursor           ctermfg=0       ctermbg=5       cterm=none
" highlight htmlEndTag       ctermfg=114     ctermbg=none    cterm=none
" highlight xmlEndTag        ctermfg=114     ctermbg=none    cterm=none
