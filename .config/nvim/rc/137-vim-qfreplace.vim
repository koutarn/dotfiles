UsePlugin 'vim-qfreplace'
"==================================
"'thinca/vim-qfreplace'
"==================================
augroup vimrc_qfreplace
  autocmd!
  autocmd Filetype qf nnoremap <buffer>r <Cmd>Qfreplace<CR>
  autocmd Filetype qfreplace nnoremap <buffer>o <CR>
  autocmd Filetype qfreplace nnoremap <buffer>q <Cmd>cclose<CR>
augroup END
