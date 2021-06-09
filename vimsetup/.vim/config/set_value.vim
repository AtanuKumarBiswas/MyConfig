syntax on
set encoding=utf-8 " Set default encoding to UTF-8
set spelllang=en " Set spell checking language as english
set noerrorbells
set tabstop=4 
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set smarttab
set autoindent
set autoread
set cindent
set tw=80
set numberwidth=5 " Make the gutter for numbers wider by default

set number "Show line number
set relativenumber " Show relative line number
set ruler " Show the line and column numbers of the cursor.
set guifont=*
set backspace=indent,eol,start
set display+=lastline
set mouse=a
set clipboard=unnamedplus  " Yank(copy) to clipboard

"set spellsuggest?

" Make splits open in more natural locations
set splitbelow
set splitright

set noshowmode " Show current mode.
set incsearch " Shows the match while typing
set hlsearch " Highlight found searches
set ignorecase " Search case insensitive...
set smartcase " ... but not when search pattern contains upper case characters	


"set complete+=kspell
"set completeopt=menuone,longest




" Set matching bracket for 1 second
set mat=1
" Cursor line but only current window and not when inserting text
set cursorline
autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline



"set complete+=kspell 
"set completeopt=menuone,longest


set completeopt+=menuone   " show the popup menu even when there is only 1 match
set completeopt+=noinsert  " don't insert any text until user chooses a match
" set completeopt+=noselect  " don't insert any text until user chooses a match
" set completeopt-=longest   " don't insert the longest common text

set completeopt+=preview

" "Kite setup
set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-15.(%l,%c%V%)\ %P
set laststatus=2 " always display the status line
" " Python, JavaScript, Go,
" let g:kite_supported_languages = ['python', 'javascript', 'go']
"
" " All the languages Kite supports
let g:kite_supported_languages = ['*']
"
" " Turn off Kite
" let g:kite_supported_languages = ['*']


 let g:kite_previous_placeholder = '<C-h>'
 let g:kite_next_placeholder = '<C-l>'

let g:kite_tab_complete=1


" "alvan vim-closetag"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'


" Coc
autocmd FileType *  let b:coc_suggest_disable = 1


" Nerd tree status icon
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }


" vim-airline symbols
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
