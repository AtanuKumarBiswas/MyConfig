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
Plugin 'iamcco/markdown-preview.nvim'


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
"
let g:solarized_termcolors=256
syntax enable
set background=dark
"set term=screen-256color
" set t_tu=
colorscheme gruvbox-material 
let g:gruvbox_contrast_dark = 'hard'

set  rtp+=/home/atanubuntu/.local/lib/python3.8/site-packages/powerline/bindings/vim/
set laststatus=2

set encoding=utf-8
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
set cursorline
set cursorcolumn

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

"nnoremap <C-Right> :tabnext<CR>
"nnoremap <C-Left> :tabprevious<CR>
"autocmd filetype cpp nnoremap <F5> :w <bar> !g++ -std=c++17 -O2 -Wall % -o %:r && %:r.exe <CR>
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

