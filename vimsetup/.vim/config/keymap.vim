" write quit ; vim
" nnoremap ; :
" :command W w
" :command WQ wq
" :command Wq wq
" :command Q q
" :command Qa qa
" :command QA q
"

nnoremap ; :
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall


" insert line bellow (capital O) or above (small o) and then go to normal mode
:nnoremap <M-o> o<Esc>
:nnoremap <M-S-o> O<Esc>


nnoremap <tab> :tabnext<CR>
nnoremap <S-tab> :tabprevious<CR>
nnoremap te :tabedit
nnoremap <M-w> :wq<CR>
nnoremap <M-S-w> :q!<CR>


nnoremap <space>t :TagbarOpenAutoClose <CR>

nnoremap <space>e :CocCommand explorer --quit-on-open --toggle --focus <CR>




" Now make navigating between splits a little easier. Just use leader h,j,k,l
" nnoremap <Leader>j <C-W>v
" nnoremap <Leader><Down> <C-W><C-J>
" nnoremap <Leader>k <C-W><C-K>
" nnoremap <Leader><Up> <C-W><C-K>
" nnoremap <Leader>l <C-W><C-L>
" nnoremap <Leader><Right> <C-W><C-L>
" nnoremap <Leader>h <C-W><C-H>
" nnoremap <Leader><Left> <C-W><C-H>
"


"NerdTree
"
let NERDTreeQuitOnOpen=1
nnoremap <space>e :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <M-f> :NERDTreeFind<CR>

imap <M-h> <down>
imap <M-l> <up>
