UsePlugin 'ddu.vim'
call ddu#custom#patch_global({
\   'ui': 'ff',
\   'sourceOptions': {
\     '_': {
\       'ignoreCase':v:true,
\       'matchers': ['matcher_substring'],
\     },
\     'file_rec':{
\       'matchers':[
\           'matcher_relative','matcher_hidden',
\       ],
\     },
\   },
\   'kindOptions': {
\     'file': {
\       'defaultAction': 'open',
\     },
\   },
\   'uiParams': {
\     'ff': {
\       'startFilter': v:true,
\       'prompt': '> ',
\     }
\   },
\ })

autocmd FileType ddu-ff call s:ddu_my_settings()
function! s:ddu_my_settings() abort
    nnoremap <buffer><silent><Space> <Cmd>call ddu#ui#ff#do_action('itemAction', {'name': 'open'})<CR>
    nnoremap <buffer><silent>o <Cmd>call ddu#ui#ff#do_action('itemAction', {'name': 'open'})<CR>
    nnoremap <buffer><silent>c <Cmd>call ddu#ui#ff#do_action('itemAction', {'name': 'cd'})<CR>
    nnoremap <buffer><silent>i <Cmd>call ddu#ui#ff#do_action('openFilterWindow')<CR>
    nnoremap <buffer><silent>p <Cmd>call ddu#ui#ff#do_action('preview')<CR>
    nnoremap <buffer><silent>q <Cmd>call ddu#ui#ff#do_action('quit')<CR>
    nnoremap <buffer><silent><ESC> <Cmd>call ddu#ui#ff#do_action('quit')<CR>
endfunction

autocmd FileType ddu-ff-filter call s:ddu_filter_my_settings()
function! s:ddu_filter_my_settings() abort
  inoremap <buffer><silent><CR> <Esc><Cmd>close<CR>
  inoremap <buffer><silent><Esc> <Esc><Cmd>close<CR>
  inoremap <buffer><silent><Space> <Esc><Cmd>close<CR>
  nnoremap <buffer><silent><CR> <Cmd>close<CR>
  nnoremap <buffer><silent><Esc> <Cmd>close<CR>
  nnoremap <buffer><silent><Space> <Esc><Cmd>close<CR>
endfunction

nnoremap <Leader>;; <Cmd>Ddu file_rec<CR>
nnoremap <Leader>;f <Cmd>Ddu file<CR>
nnoremap <Leader>;b <Cmd>Ddu buffer<CR>
nnoremap <Leader>;g <Cmd>Ddu -name=search rg -ui-param-ignoreEmpty -source-param-input=`input('Pattern: ')`<CR>
nnoremap <Leader>/ <Cmd>Ddu -name=search line -ui-param-startFilter<CR>
" nnoremap <silent> <Leader>f, <Cmd>Ddu -name=files file_rec -source-option-path='`fnamemodify($MYVIMRC, ':h')` <CR>
