if exists('did_load_filetypes')
  finish
endif

augroup filetypedetect
  autocmd BufNewFile,BufRead *.txt  setfiletype markdown
  autocmd BufNewFile,BufRead *.less     setfiletype less
  autocmd BufNewFile,BufRead *.sass     setfiletype sass
  autocmd BufNewFile,BufRead *.scss     setfiletype scss
  autocmd BufNewFile,BufRead *.fish setfiletype fish
  autocmd BufNewFile,BufRead *.vb setfiletype vb
  autocmd BufNewFile,BufRead *.cls setfiletype vb
  autocmd BufNewFile,BufRead *.bas setfiletype vb
augroup END
