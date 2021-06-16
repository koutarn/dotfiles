UsePlugin 'vim-findent'
"==================================
"lambdalisue/vim-findent
"==================================
augroup vimrc_findent
  autocmd!
  autocmd FileType c Findent --no-messages
  autocmd FileType css Findent --no-messages
  autocmd FileType html Findent --no-messages
  autocmd FileType javascript Findent --no-messages
  autocmd FileType markdown Findent --no-messages
augroup END
