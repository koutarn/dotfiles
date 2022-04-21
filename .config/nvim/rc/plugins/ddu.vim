UsePlugin 'ddu.vim'


call ddu#custom#alias('source', 'git_ls', 'file_external')
call ddu#custom#patch_global({
\'ui': 'ff',
\    'sources': [
\        {
\            'name': 'file_rec',
\            'params': {
\                'ignoredDirectories': ['.svn','.git', 'node_modules', 'vendor', '.next']
\            }
\        },
\        {'name': 'file'},
\        {'name': 'buffer'},
\        {'name': 'help'},
\        {'name': 'source'},
\        {'name': 'external'},
\        {'name': 'colorscheme'},
\        {
\            'name': 'git_ls',
\            'params': {
\               'cmd': ['git', 'ls-files'],
\            }
\        },
\    ],
\
\    'sourceOptions': {
\        '_': {
\            'ignoreCase':v:true,
\            'matchers': ['matcher_fzf'],
\        },
\        'file_rec': {
\            'ignoreCase':v:true,
\            'matchers': ['matcher_fzf','matcher_hidden'],
\            'maxItems':20000,
\        },
\    },
\    'kindOptions': {
\        '_': {
\            'defaultAction': 'open',
\        },
\        'source': {
\            'defaultAction':'execute',
\        },
\        'colorscheme': {
\            'defaultAction':'set',
\        },
\    },
\    'uiParams': {
\        'ff': {
\            'startFilter': v:true,
\            'prompt': '> ',
\            'previewFloating':v:false,
\            'previewHeight':30,
\            'previewVertical':v:true,
\            'floatingBorder':'single',
\            'split':'floating',
\            'winHeight':30,
\            'winRow':&lines / 2 - 15,
\            'winWidth':&columns / 2,
\            'reversed': v:false,
\        }
\    },
\})

autocmd FileType ddu-ff call s:ddu_my_settings()
function! s:ddu_my_settings() abort
    nnoremap <buffer><Leader><space> <Nop>
    nnoremap <buffer><silent><CR> <Cmd>call ddu#ui#ff#do_action('itemAction', {'name': 'default'})<CR>
    nnoremap <buffer><silent><Space> <Cmd>call ddu#ui#ff#do_action('itemAction', {'name': 'default'})<CR>
    nnoremap <buffer><silent>o <Cmd>call ddu#ui#ff#do_action('itemAction', {'name': 'default'})<CR>
    nnoremap <buffer><silent>c <Cmd>call ddu#ui#ff#do_action('itemAction', {'name': 'cd'})<CR>
    nnoremap <buffer><silent>i <Cmd>call ddu#ui#ff#do_action('openFilterWindow')<CR>
    nnoremap <buffer><silent>/ <Cmd>call ddu#ui#ff#do_action('openFilterWindow')<CR>
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

nnoremap <Leader>;; <Cmd>Ddu -name=file_rec file_rec -source-option-path='`fnamemodify(getcwd(), ':p')`'<CR>
nnoremap <Leader>f, <Cmd>Ddu -name=vimrc file_rec -source-option-path='`fnamemodify($MYVIMRC, ':h')`'<CR>
nnoremap <Leader>;' <Cmd>Ddu -name=mr mr<CR>
nnoremap <Leader>;[ <Cmd>Ddu -name=git-ls git_ls<CR>
nnoremap <Leader>;p <Cmd>Ddu -name=source source<CR>
nnoremap <Leader>;b <Cmd>Ddu -name=buffer buffer<CR>
nnoremap <Leader>;g <Cmd>Ddu -name=search rg -ui-param-ignoreEmpty -source-param-input=`input('Pattern:')`<CR>
nnoremap <Leader>;h <Cmd>Ddu -name=other help colorscheme<CR>
nnoremap <Leader>/ <Cmd>Ddu -name=search line -ui-param-startFilter<CR>
