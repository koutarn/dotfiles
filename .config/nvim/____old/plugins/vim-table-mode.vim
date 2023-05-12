
"==================================
"dhruvasagar/vim-table-mode
"==================================
let g:table_mode_auto_align = 1
let g:table_mode_always_active = 0
let g:table_mode_map_prefix = '<Leader>tm'
let g:table_mode_separator_map = '<Bar>'
let g:table_mode_corner='|'
" g:table_mode_disable_mappings = 1

augroup vimrc_tablemode
  autocmd!
  " autocmd Filetype markdown inoremap <buffer> ;f <Bar>
  " autocmd Filetype markdown inoremap <buffer> ;d -
augroup END
