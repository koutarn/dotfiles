UsePlug 'vim-buffergator'
" =================================
" jeetsukumaran/vim-buffergator
" =================================

" Original code was posted to vim-jp.slack.com
" author: https://github.com/kuuote
function! s:buffergator_filter() abort
  let lines = copy(s:lines)
  let text = getcmdline()
  call filter(lines, {_, val -> val =~? text})
  setlocal modifiable
  silent 1,$delete _
  silent 0put=lines
  $d
  setlocal nomodifiable
  call cursor('$', 1)
  redraw
endfunction

function! s:buffergator_cmd() abort
  autocmd FuzzyBuffgator CmdlineChanged * call s:buffergator_filter()
  call input('buffergator: ')
endfunction

augroup FuzzyBuffgator
  autocmd!
  autocmd CmdlineLeave * autocmd! FuzzyBuffgator CmdlineChanged
augroup END

function! s:read_buffergator_buffer(timer) abort
  let s:lines = getline(1, '$')
endfunction

function! s:buffergator_init() abort
  call timer_start(0, function('s:read_buffergator_buffer'))
endfunction

function! s:buffergator_enter() abort
  let line = getline('.')
  let bufnum = matchstr(getline('.'), '^.*\[\zs.*\ze\]')
  execute 'bdelete | wincmd w | '. 'buffer ' . trim(bufnum)
endfunction

autocmd FileType buffergator call s:buffergator_init()
autocmd FileType buffergator noremap <silent> <buffer> <Leader>/ :<C-u>call <SID>buffergator_cmd()<CR>
autocmd FileType buffergator noremap <silent> <buffer> m :<C-u>call <SID>buffergator_enter()<CR>
