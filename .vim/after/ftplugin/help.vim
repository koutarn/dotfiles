 setlocal number
 nnoremap <buffer> <CR> <C-]>
 nnoremap <buffer> <BS> <C-T>

" from kuuote's vimrc
" helpのタグ移動を楽にするやつ
" autocmd FileType help nested if &l:buftype ==# 'help'
"   \ |             nnoremap <buffer> <CR> <C-]>
"   \ |             nnoremap <buffer> <BS> <C-T>
"   \ |           endif
" augroup END
