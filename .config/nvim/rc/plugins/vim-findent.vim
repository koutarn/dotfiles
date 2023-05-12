
"==================================
"lambdalisue/vim-findent
"==================================
augroup vimrc_findent
  autocmd!
  autocmd FileType c,css,html,javascript,markdown Findent --no-messages
augroup END
