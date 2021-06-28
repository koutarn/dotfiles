UsePlugin 'twitvim'
" ========================
" 'twitvim/twitvim'
" ========================
let twitvim_show_header = 0
let twitvim_count = 150
let twitvim_timestamp_format = '%Y/%m/%d %R'
let twitvim_browser_cmd = 'google-chrome-stable'

augroup vimrc_twitvim
  autocmd!
  autocmd  FileType twitvim setlocal wrap wrapmargin=60 number
  autocmd  FileType twitvim nnoremap <buffer><silent> q :<C-u>close<CR>
augroup END
