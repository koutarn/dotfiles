UsePlugin 'ddu.vim'

call ddu#custom#alias('source','dot_rec','file_rec')

call ddu#custom#patch_global({
\   'ui': 'ff',
\   'sources': [
\     {
\       'name': 'file_rec',
\       'params': {
\         'ignoredDirectories': ['.git', 'node_modules', 'vendor', '.next']
\       }
\     },
\     {'name': 'file'},
\     {'name': 'buffer'},
\   ],
\   'sourceOptions': {
\     '_': {
\       'ignoreCase':v:true,
\       'matchers': ['matcher_fzf'],
\     },
\     'file_rec': {
\       'ignoreCase':v:true,
\       'matchers': ['matcher_fzf','matcher_relative','matcher_hidden'],
\       'path':expand('.'),
\     },
\     'dot_rec':{
\       'ignoreCase':v:true,
\       'matchers': ['matcher_fzf','matcher_relative','matcher_hidden'],
\       'path':expand('~/.config/nvim'),
\     },
\   },
\   'kindOptions': {
\     '_': {
\       'defaultAction': 'open',
\     },
\   },
\   'uiParams': {
\     'ff': {
\       'startFilter': v:true,
\       'prompt': '> ',
\       'previewFloating':v:false,
\       'previewHeight':30,
\       'previewVertical':v:true,
\       'floatingBorder':'single',
\       'split':'floating',
\       'winHeight':30,
\       'winRow':&lines / 2 - 15,
\       'winWidth':&columns / 2,
\       'reversed': v:false,
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
nnoremap <Leader>;' <Cmd>Ddu mr<CR>
" nnoremap <Leader>f, <Cmd>Ddu dot_rec<CR>
nnoremap <Leader>;b <Cmd>Ddu buffer<CR>
nnoremap <Leader>;g <Cmd>Ddu -name=search rg -ui-param-ignoreEmpty -source-param-input=`input('Pattern: ')`<CR>
nnoremap <Leader>/ <Cmd>Ddu -name=search line -ui-param-startFilter<CR>
" nnoremap <silent> <Leader>f, <Cmd>Ddu -name=files file_rec -source-option-path='`fnamemodify($MYVIMRC, ':h')` <CR>
