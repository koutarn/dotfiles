UsePlugin 'fern-preview.vim'
"==================================
"yuki-yano/fern-preview.vim
"==================================

function! s:init_fern_preiew()
  nmap <silent> <buffer> p     <Plug>(fern-action-preview:toggle)
  " nmap <silent> <buffer>p <Plug>(fern-action-preview:toggle-auto-preview)
endfunction

augroup vimrc_fern_preview
  autocmd!
  autocmd FileType fern call s:init_fern_preiew()
augroup END

" let g:fern_preview_default_mapping = 0
let g:fern_auto_preview = 1
