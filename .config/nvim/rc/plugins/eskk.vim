UsePlugin 'eskk.vim'
"=========================
" 'tyru/eskk.vim'
"=========================
let g:eskk#directory = '~/.config/eskk'
let g:eskk#dictionary = { 'path': '~/.config/eskk/my_jisyo', 'sorted': 1, 'encoding': 'utf-8'}
let g:eskk#large_dictionary = {'path': '~/.config/eskk/SKK-JISYO.L', 'sorted': 1, 'encoding': 'euc-jp'}

" autocmd User eskk-initialize-post call s:eskk_initial_pre()
" function! s:eskk_initial_pre() abort
  " EskkUnmap -type=sticky Q
  " EskkMap -type=sticky ;
" endfunction


"zennのコメント欄でランライナーで書けると指摘してもらった。感謝。
" function! s:markdown_eskk() abort
"   if &filetype == 'markdown' && s:toggle_markdown_eskk ==# 1
"     call eskk#enable()
"   endif
" endfunction

let s:toggle_markdown_eskk = 0
function! s:markdown_eskk_toggle() abort
  let s:toggle_markdown_eskk = s:toggle_markdown_eskk == 1 ? 0 : 1
  if s:toggle_markdown_eskk ==# 1
    echomsg  '日本語入力モードON'
  else
    echomsg  '日本語入力モードOFF'
  endif
endfunction

" imap jk <Plug>(eskk:toggle)
" cmap jk <Plug>(eskk:toggle)
let g:eskk#kakutei_when_unique_candidate = 1
let g:eskk#enable_completion = 0
let g:eskk#no_default_mappings = 1
let g:eskk#marker_henkan = '[変換]'
let g:eskk#marker_henkan_select = '[選択]'
let g:eskk#marker_okuri = '[送り]'
let g:eskk#marker_jisyo_touroku = '[辞書]'
let g:eskk#keep_state = 0
let g:eskk#keep_state_beyond_buffer = 0
let g:eskk#egg_like_newline = 1


augroup vimrc_eskk
  autocmd!
  "markdownは日本語を打つ前提で行っておく
  autocmd InsertEnter * if &filetype == 'markdown' && s:toggle_markdown_eskk | call eskk#enable() | endif
  autocmd User eskk-enable-post lmap <buffer> l <Plug>(eskk:disable)
  autocmd Filetype markdown nnoremap <buffer><silent> <F1> <Cmd>call <SID>markdown_eskk_toggle()<CR>
augroup END

