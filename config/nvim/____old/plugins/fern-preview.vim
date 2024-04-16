
"==================================
"yuki-yano/fern-preview.vim
"==================================

augroup vimrc_fern_preview
  autocmd!
  autocmd FileType fern nmap <buffer> p <Plug>(fern-action-preview:auto:toggle)
augroup END
