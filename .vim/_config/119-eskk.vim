UsePlugin 'eskk.vim'
"=========================
" 'tyru/eskk.vim'
"=========================
let g:eskk#directory = "~/.config/eskk"
let g:eskk#dictionary = { 'path': "~/.config/eskk/my_jisyo", 'sorted': 1, 'encoding': 'utf-8',}
let g:eskk#large_dictionary = {'path': "~/.config/eskk/SKK-JISYO.L", 'sorted': 1, 'encoding': 'euc-jp',}

autocmd User eskk-initialize-post call s:eskk_initial_pre()
function! s:eskk_initial_pre() abort
  EskkUnmap -type=sticky Q
  EskkMap -type=sticky ;
endfunction

augroup vimrc_eskk
  autocmd!
  "markdownは日本語を打つ前提で行っておく
  autocmd InsertEnter * call s:markdown_eskk()
augroup END

function! s:markdown_eskk() abort
  if &filetype == 'markdown'
    call eskk#enable()
  endif
endfunction

imap <C-o> <Plug>(eskk:toggle)
cmap <C-o> <Plug>(eskk:toggle)
let g:eskk#kakutei_when_unique_candidate = 1
let g:eskk#enable_completion = 0
let g:eskk#no_default_mappings = 1

let g:eskk#marker_henkan = "[H]"
let g:eskk#marker_henkan_select = "[S]"
let g:eskk#marker_okuri = "[O]"
let g:eskk#marker_jisyo_touroku = "[D]"
let g:eskk#keep_state = 0
let g:eskk#keep_state_beyond_buffer = 0
let g:eskk#egg_like_newline = 1
