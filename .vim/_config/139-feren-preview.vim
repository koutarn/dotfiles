UsePlugin 'fern-preview.vim'
"==================================
"yuki-yano/fern-preview.vim
"==================================

function! s:init_fern_preiew()
  nmap <buffer>p <Plug>(fern-action-preview:toggle-auto-preview)
endfunction

augroup vimrc_fern_preview
  autocmd!
  autocmd FileType fern call s:init_fern_preiew()
augroup END

let g:fern_preview_max_width = &columns
let g:fern_preview_max_height = &columns
let g:fern_preview_default_mapping = 0
