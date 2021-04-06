"File Type
augroup vimrc_filetype
  filetype on
  filetype plugin on
  filetype indent on

  autocmd BufNewFile,BufRead *.md   setfiletype markdown
  autocmd BufNewFile,BufRead *.txt  setfiletype markdown
  autocmd BufNewFile,BufRead *.fish setfiletype fish
  autocmd BufNewFile,BufRead *.c    setfiletype c syntax=c
  autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript

  autocmd FileType markdown   setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab
  autocmd FileType apache     setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab
  autocmd FileType css        setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab
  autocmd FileType diff       setlocal shiftwidth=4 softtabstop=4 tabstop=4 noexpandtab
  autocmd FileType xml        setlocal shiftwidth=4 softtabstop=4 tabstop=4 noexpandtab
  autocmd FileType java       setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab
  autocmd FileType sql        setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab
  autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
  autocmd FileType ruby       setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
  autocmd FileType eruby      setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
  autocmd FileType yaml       setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
  autocmd FileType coffee     setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
  autocmd FileType tex        setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
  autocmd FileType html       setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
  autocmd FileType sql        setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
  autocmd FileType sh         setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
  autocmd FileType vim        setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
  autocmd FileType bash       setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
  autocmd FileType zsh        setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
  autocmd FileType fish       setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
  autocmd FileType help       setlocal number
  autocmd BufNewFile,BufRead *.vb setfiletype vb
  autocmd BufNewFile,BufRead *.cls setfiletype vb
  autocmd BufNewFile,BufRead *.bas setfiletype vb

  " from kuuote's vimrc
  " helpのタグ移動を楽にするやつ
  autocmd FileType help nested if &l:buftype ==# 'help'
    \ |             nnoremap <buffer> <CR> <C-]>
    \ |             nnoremap <buffer> <BS> <C-T>
    \ |           endif
augroup END
