"bronson/vim-trailing-whitespace
" ファイル保存時に余分なスペースを削除する
autocmd BufWritePre * :FixWhitespace
