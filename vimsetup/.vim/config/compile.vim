" Compile and run terminal"

"c compile and run"
autocmd filetype c nnoremap <F9>
            \ <ESC>:w<CR>
            \ <ESC>:e<CR>
            \ :let @+ = expand("%:p:h")<CR>
            \ :!xclip -o -sel clip > /tmp/vimDir<CR>
            \ :let @+ = expand("%:t")<CR>
            \ :!xclip -o -sel clip > /tmp/vimFile<CR>
            \ :!gnome-terminal -- bash -c '
            \cd;
            \Dir=$(cat /tmp/vimDir);
            \cd $Dir;
            \File=$(cat /tmp/vimFile);
            \gcc -Wall -std=gnu11 $File -lm;
            \./a.out;
            \echo Press Enter to Exit;
            \read lines;
            \rm *.out;
            \'<CR><CR>


" "cpp compile and run"

autocmd filetype cpp nnoremap <F9>
            \ <ESC>:w<CR>
            \ <ESC>:e<CR>
            \ :let @+ = expand("%:p:h")<CR>
            \ :!xclip -o -sel clip > /tmp/vimDir<CR>
            \ :let @+ = expand("%:t")<CR>
            \ :!xclip -o -sel clip > /tmp/vimFile<CR>
            \ :!gnome-terminal -- bash -c '
            \cd;
            \Dir=$(cat /tmp/vimDir);
            \cd $Dir;
            \File=$(cat /tmp/vimFile);
            \g++ -Wall -std=gnu++11 $File -lm;
            \./a.out;
            \echo Press Enter to Exit;
            \read lines;
            \rm *.out;
            \'<CR><CR>

"python compile and run"

autocmd filetype python nnoremap <F9>
            \ <ESC>:w<CR>
            \ <ESC>:e<CR>
            \ :let @+ = expand("%:p:h")<CR>
            \ :!xclip -o -sel clip > /tmp/vimDir<CR>
            \ :let @+ = expand("%:t")<CR>
            \ :!xclip -o -sel clip > /tmp/vimFile<CR>
            \ :!gnome-terminal -- bash -c '
            \cd;
            \source /home/atanuu/Codes/atPy38/bin/activate;
            \Dir=$(cat /tmp/vimDir);
            \cd $Dir;
            \File=$(cat /tmp/vimFile);
            \python -u $File;
            \echo Press Enter to Exit;
            \read lines;
            \'<CR><CR>

            " \source /home/atanuu/Codes/atPy38/bin/activate
" autocmd filetype python nnoremap <F9> :w <bar> 
" \ exec '!start pwsh.exe -Command 
" \ "conda activate MyPy38R";
" \ "F:\anaconda3\envs\MyPy38R\python.exe %";
" \ "read-host "**press ENTER to exit**"'
" \ <CR><CR>
"
" "java compile and run"
autocmd filetype java nnoremap <F9>
            \ <ESC>:w<CR>
            \ <ESC>:e<CR>
            \ :let @+ = expand("%:p:h")<CR>
            \ :!xclip -o -sel clip > /tmp/vimDir<CR>
            \ :let @+ = expand("%:t")<CR>
            \ :!xclip -o -sel clip > /tmp/vimFile<CR>
            \ :let @+ = expand("%:t:r")<CR>
            \ :!xclip -o -sel clip > /tmp/vimJavaWithoutExt<CR>
            \ :!gnome-terminal -- bash -c '
            \cd;
            \Dir=$(cat /tmp/vimDir);
            \cd $Dir;
            \File=$(cat /tmp/vimFile);
            \javac $File;
            \ClassFile=$(cat /tmp/vimJavaWithoutExt);
            \java $ClassFile;
            \echo Press Enter to Exit;
            \read lines;
            \rm *.class;
            \'<CR><CR>

" " filename / dirname of the current file {{{
"     " copy result to the system clipboard and echo the result
"     " the cb> prompt means the clipboard
"     " *f*ile *n*ame, ex. init.vim
"     map <Leader>fn :let @+ = expand("%:t") \| echo 'cb> ' . @+<CR>
"     " *f*ile *p*ath, ex. /home/user/nvim/init.vim
"     map <Leader>fp :let @+ = expand("%:p") \| echo 'cb> ' . @+<CR>
"     " *d*irectory *p*ath, ex. /home/user/nvim
"     map <Leader>dp :let @+ = expand("%:p:h") \| echo 'cb> ' . @+<CR>
"     " *d*irectory *n*ame, ex. nvim
"     map <Leader>dn :let @+ = expand("%:p:h:t") \| echo 'cb> ' . @+<CR>
"     " *d*irectory *n*ame, ex. init 
"     map <Leader>dn :let @+ = expand("%:t:r") \| echo 'cb> ' . @+<CR>
"
" " }}}
