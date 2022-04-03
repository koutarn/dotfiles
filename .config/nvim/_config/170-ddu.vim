call ddu#custom#patch_global({
\   'ui': 'ff',
\   'sources': [
\     {
\       'name': 'file_rec',
\       'params': {
\         'ignoredDirectories': ['.svn','.git', 'node_modules', 'vendor', '.next','build','.config']
\       }
\     },
\     {
\       'name': 'buffer',
\     },
\     {
\       'name': 'file',
\     }
\   ],
\   'sourceOptions': {
\     '_': {
\       'matchers': ['matcher_substring'],
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

" call ddu#custom#patch_local('grep', {
" \   'sourceParams' : {
" \     'rg' : {
" \       'args': ['--column', '--no-heading', '--color', 'never','--json'],
" \       'options': {'matchers': []},
" \       'volatile':v:true,
" \     },
" \   'uiParams': {'ff': {
" \     'ignoreEmpty': v:false,
" \     'autoResize': v:false,
" \   }},
" \   },
" \ })


autocmd FileType ddu-ff call s:ddu_my_settings()
function! s:ddu_my_settings() abort
    nnoremap <buffer><silent> <Space>
    \ <Cmd>call ddu#ui#ff#do_action('itemAction', {'name': 'open'})<CR>
    nnoremap <buffer><silent> c
    \ <Cmd>call ddu#ui#ff#do_action('itemAction', {'name': 'cd'})<CR>
    nnoremap <buffer><silent> i
        \ <Cmd>call ddu#ui#ff#do_action('openFilterWindow')<CR>
    nnoremap <buffer><silent> p
        \ <Cmd>call ddu#ui#ff#do_action('preview')<CR>
    nnoremap <buffer><silent> q
        \ <Cmd>call ddu#ui#ff#do_action('quit')<CR>
    nnoremap <buffer><silent> <ESC>
        \ <Cmd>call ddu#ui#ff#do_action('quit')<CR>
endfunction

autocmd FileType ddu-ff-filter call s:ddu_filter_my_settings()
function! s:ddu_filter_my_settings() abort
  inoremap <buffer><silent> <CR>
    \ <Esc><Cmd>close<CR>

  inoremap <buffer><silent> <Esc>
    \ <Esc><Cmd>close<CR>

  inoremap <buffer><silent> <Space>
        \ <Esc><Cmd>close<CR>

  nnoremap <buffer><silent> <CR>
    \ <Cmd>close<CR>

  nnoremap <buffer><silent> <Esc>
    \ <Cmd>close<CR>

  nnoremap <buffer><silent> <Space>
      \ <Esc><Cmd>close<CR>
endfunction

nmap <silent> <Leader>;; <Cmd>call ddu#start({'sources':[{'name': 'file_rec'}]})<CR>
nmap <silent> <Leader>;f <Cmd>call ddu#start({'sources':[{'name': 'file'}]})<CR>
nmap <silent> <Leader>;b <Cmd>call ddu#start({'sources':[{'name': 'buffer'}]})<CR>
