syntax on
colors tokyo-metro
set colorcolumn=80
highlight ColorColumn ctermbg=DarkGrey
"set number
filetype plugin indent on
"Set background colour"
set t_ut=
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" cursor color
"hi CursorLineNr guifg=#050505
set cursorline
set laststatus=2        "show statusbar
set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
hi StatusLine ctermbg=White ctermfg=DarkGrey
set mouse=a "turn mouse on

autocmd bufnewfile *.{c,h} 0r ~/.vim/c_template.c
autocmd bufnewfile *.{c,h} exe "1," . 10 . "g/File:.*/s//File: " .expand("%")
autocmd bufnewfile *.{c,h} exe "1," . 10 . "g/Date:.*/s//Date: " .strftime("%c")

function! s:insert_gates()
    let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
    execute "normal! GA#ifndef " . gatename
    execute "normal! o#define " . gatename . " "
    normal! o
    execute "normal! Go#endif /* " . gatename . " */"
    normal! kkkkkk
endfunction

function s:cursormove()
    normal! jjj$
endfunction

autocmd BufNewFile *.{c,cpp} call <SID>cursormove()
autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()

set number "turn linenumbering on
