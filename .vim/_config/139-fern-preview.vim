UsePlugin 'fern-preview.vim'
"==================================
"yuki-yano/fern-preview.vim
"==================================

augroup vimrc_fern_preview
  autocmd!
  autocmd FileType fern nmap <buffer> p <Plug>(fern-action-preview:auto:toggle)
augroup END

" let g:fern_preview_default_mapping = 0
" let g:fern_auto_preview = 1
