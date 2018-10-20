"複数の候補から選べるようにする
nnoremap ] g<C-]>

nnoremap v] :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap s] :split<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <Leader>t :Tags<CR>
nnoremap <Leader>G :TagsGenerate<CR>
