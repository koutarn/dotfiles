"複数の候補から選べるようにする
nnoremap <F10> g<C-]>

nnoremap v<F10> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap s<F10> :split<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <Leader>t :Tags<CR>
nnoremap <Leader>G :TagsGenerate<CR>
