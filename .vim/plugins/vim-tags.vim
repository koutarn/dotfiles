"複数の候補から選べるようにする
nnoremap <C-]> g<C-]>

nnoremap <C-v> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-s> :split<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <Leader>t :Tags<CR>
nnoremap <Leader>G :TagsGenerate<CR>
