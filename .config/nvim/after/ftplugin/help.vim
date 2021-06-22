setlocal cursorline
setlocal nospell
setlocal nolist
setlocal nohlsearch

function! s:help_settings() abort
    if &buftype ==# 'help'
        nnoremap <buffer><CR> <C-]>
        nnoremap <buffer><BS> <C-T>
        nnoremap <buffer>o <C-]>
        nnoremap <buffer>i <C-T>
        nnoremap <buffer>q :<C-u>helpclose<CR>
    endif
endfunction

call s:help_settings()
