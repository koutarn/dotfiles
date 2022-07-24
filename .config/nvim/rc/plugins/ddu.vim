UsePlugin 'ddu.vim'

"alias
call ddu#custom#alias('source', 'ghq', 'file_external')
call ddu#custom#alias('source', 'zoxide', 'file_external')
call ddu#custom#alias('source', 'git-ls', 'file_external')

call ddu#custom#patch_global('sourceParams', {
\       'ghq': {
\           'cmd': ['ghq', 'list', '-p']
\       },
\       'git-ls': {
\           'cmd': ['git', 'ls-files', '-co', '--exclude-standard'],
\       },
\       'zoxide': {
\           'cmd': ['zoxide', 'query', '--list'],
\       },
\       'rg': {
\           'args': [
\               '--hidden','--ignore-case','--column', '--no-heading','--color', 'never',
\           ],
\       },
\ })

" 設定
call ddu#custom#patch_global({
\   'ui': 'ff',
\   'columns': ['icon_filename'],
\   'sources': [
\       {
\           'name': 'file_rec',
\           'params': {
\               'ignoredDirectories': ['.svn','.git', 'node_modules', 'vendor', '.next']
\           }
\       },
\       {'name': 'file'},
\       {'name': 'buffer'},
\       {'name': 'help'},
\       {'name': 'source'},
\       {'name': 'external'},
\       {'name': 'colorscheme'},
\   ],
\   'sourceOptions': {
\       '_': {
\           'ignoreCase': v:true,
\           'matchers': [
\               'matcher_fzf',
\           ],
\           'maxItems':20000,
\       },
\       'file': {
\           'matchers': [
\               'matcher_fzf', 'matcher_relative', 'matcher_hidden',
\           ],
\       },
\       'file_rec': {
\           'matchers': [
\               'matcher_fzf', 'matcher_relative', 'matcher_hidden',
\           ],
\       },
\       'file_point': {
\           'matchers': [
\               'matcher_fzf', 'matcher_relative', 'matcher_hidden',
\           ],
\       },
\   },
\   'kindOptions': {
\       'file': {
\           'defaultAction': 'open',
\       },
\       'source': {
\           'defaultAction':'execute',
\       },
\       'colorscheme': {
\           'defaultAction':'set',
\       },
\   },
\   'uiParams': {
\       'ff': {
\           'filterSplitDirection': 'floating',
\           'filterFloatingPosition':'bottom',
\           'displaySourceName':'long',
\           'startFilter': v:true,
\           'floatingBorder':'none',
\           'previewFloating': v:false,
\           'previewHeight':50,
\           'prompt':'> ',
\       },
\   },
\})

" ===========================
" key mapping
" ===========================

" FF
autocmd FileType ddu-ff call s:ddu_my_settings()
function! s:ddu_my_settings() abort
    if expand('%:t') == 'ddu-ff-cd'
        nnoremap <buffer><silent><CR> <Cmd>call ddu#ui#ff#do_action('itemAction', {'name': 'cd'})<CR>
        nnoremap <buffer><silent>o <Cmd>call ddu#ui#ff#do_action('itemAction', {'name': 'cd'})<CR>
    else
        nnoremap <buffer><silent><CR> <Cmd>call ddu#ui#ff#do_action('itemAction', {'name': 'default'})<CR>
        nnoremap <buffer><silent>o <Cmd>call ddu#ui#ff#do_action('itemAction', {'name': 'open'})<CR>
    end

    "共通
    nnoremap <buffer><silent>c <Cmd>call ddu#ui#ff#do_action('itemAction', {'name': 'cd'})<CR>
    nnoremap <buffer><silent>i <Cmd>call ddu#ui#ff#do_action('openFilterWindow')<CR>
    nnoremap <buffer><silent>/ <Cmd>call ddu#ui#ff#do_action('openFilterWindow')<CR>
    nnoremap <buffer><silent>p <Cmd>call ddu#ui#ff#do_action('preview')<CR>
    nnoremap <buffer><silent>q <Cmd>call ddu#ui#ff#do_action('quit')<CR>
    nnoremap <buffer><silent><ESC> <Cmd>call ddu#ui#ff#do_action('quit')<CR>
endfunction

" フィルタ
autocmd FileType ddu-ff-filter call s:ddu_filter_my_settings()
function! s:ddu_filter_my_settings() abort
    inoremap <buffer><silent><ESC> <ESC><Cmd>call ddu#ui#ff#close()<CR>
    inoremap <buffer><silent><CR> <ESC><Cmd>call ddu#ui#ff#close()<CR>
    inoremap <buffer><silent><Space> <ESC><Cmd>call ddu#ui#ff#close()<CR>
endfunction

"ファイル
nnoremap <Leader>;;
\ <Cmd>Ddu -name=files
\ `finddir('.git', ';') != '' ? 'git-ls' : 'file_rec'`
\ -sync <CR>
nnoremap <Leader>;' <Cmd>Ddu -name=files mr<CR>
nnoremap <Leader>;j <Cmd>Ddu -name=files buffer<CR>

" ディレクトリ
nnoremap <Leader>;p <Cmd>Ddu -name=cd ghq<CR>
nnoremap <Leader>;[ <Cmd>Ddu -name=cd zoxide<CR>

" 行
nnoremap <Leader>;g <Cmd>Ddu -name=line rg -ui-param-ignoreEmpty -source-param-input=`input('Pattern:')`<CR>
nnoremap <Leader>/a <Cmd>Ddu -name=line line -ui-param-startFilter<CR>

" その他
nnoremap <Leader>;h <Cmd>Ddu -name=other help<CR>
