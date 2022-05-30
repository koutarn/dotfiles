setlocal cursorline

setlocal nospell
setlocal nolist
setlocal nohlsearch
setlocal colorcolumn=

"編集中は置き換えないようにする。
if &buftype ==# 'help'
    nnoremap <buffer><CR> <C-]>
    nnoremap <buffer><BS> <C-T>
    nnoremap <buffer>o <C-]>
    nnoremap <buffer>i <C-T>
    nnoremap <buffer>q :<C-u>helpclose<CR>
endif
