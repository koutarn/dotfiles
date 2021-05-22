UsePlugin 'vim-qfreplace'
"==================================
"'thinca/vim-qfreplace'
"==================================
augroup vimrc_qfreplace
  autocmd!
  autocmd Filetype qf nnoremap <buffer>r :<C-u>Qfreplace<CR>
  autocmd Filetype qfreplace nnoremap <buffer>o <CR>
  autocmd Filetype qfreplace nnoremap <buffer>q :<C-u>close<CR>
augroup END
