UsePlugin 'ddc.vim'

"pum.vimを使用
call ddc#custom#patch_global('completionMenu', 'pum.vim')

call ddc#custom#patch_global('keywordPattern', '[a-zA-Z_:]\w*')

"sourcesの設定
call ddc#custom#patch_global('sources', [
\ 'vim-lsp',
\ 'vsnip',
\ 'around',
\ 'skkeleton',
\ 'file',
\ 'emoji',
\ 'yank',
\ ])

"特定のファイルのみ補完
call ddc#custom#patch_filetype(['vim','toml'],'sources',['necovim'])

call ddc#custom#patch_global('sourceOptions', {
\ '_': {
\   'ignoreCase':v:true,
\   'matchers': ['matcher_fuzzy'],
\   'sorters': ['sorter_rank'],
\   'converters': ['converter_remove_overlap'],
\ },
\ 'vsnip':{
\   'mark':'🍕',
\   'dup':v:true,
\   },
\ 'cmdline': {'mark': '💻'},
\ 'cmdline-history': {'mark': '📓'},
\ 'around': {'mark':'💡'},
\ 'necovim':{'mark':'🐱'},
\ 'yank':{'mark':'📋'},
\ 'skkeleton': {
\   'mark': '🍺',
\   'matchers': ['skkeleton'],
\   'sorters': [],
\   'minAutoCompleteLength': 1,
\ },
\ 'file': {
\   'mark': '📁',
\   'isVolatile': v:true,
\   'forceCompletionPattern': '\S/\S*',
\ },
\   'vim-lsp': {
\   'mark': '🔥',
\ },
\   'emoji': {
\   'mark': '😎',
\	'matchers': ['emoji'],
\	'sorters': [],
\ },
 \})

cnoremap <expr>;; pum#visible() ? '<Cmd>call pum#map#confirm()<CR>':''
cnoremap <expr> <Tab>
    \ pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>':
    \ ddc#manual_complete()
cnoremap <expr> <S-Tab>
    \ pum#visible() ? '<Cmd>call pum#map#insert_relative(-1)<CR>':
    \ ddc#manual_complete()
cnoremap <C-n>   <Cmd>call pum#map#select_relative(+1)<CR>
cnoremap <C-p>   <Cmd>call pum#map#select_relative(-1)<CR>
cnoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
cnoremap <C-e>   <Cmd>call pum#map#cancel()<CR>


call ddc#enable()

inoremap <expr>;; pum#visible() ? '<Cmd>call pum#map#confirm()<CR>':';;'
inoremap <silent><expr> <TAB>   pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' : vsnip#jumpable(+1) ? '<Plug>(vsnip-jump-next)' : '<TAB>'
inoremap <silent><expr> <S-TAB> pum#visible() ? '<Cmd>call pum#map#insert_relative(-1)<CR>' : vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-TAB>'
inoremap <silent><expr> <C-n>   (pum#visible() ? '' : '<Cmd>call ddc#map#manual_complete()<CR>') . '<Cmd>call pum#map#select_relative(+1)<CR>'
inoremap <silent><expr> <C-p>   (pum#visible() ? '' : '<Cmd>call ddc#map#manual_complete()<CR>') . '<Cmd>call pum#map#select_relative(-1)<CR>'
autocmd User PumCompleteDone call vsnip_integ#on_complete_done(g:pum#completed_item)

inoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
inoremap <C-e>   <Cmd>call pum#map#cancel()<CR>

"command line complete
call ddc#custom#patch_global('autoCompleteEvents',
    \ ['InsertEnter', 'TextChangedI', 'TextChangedP', 'CmdlineChanged'])
nnoremap ; <Cmd>call CommandlinePre()<CR>:

function! CommandlinePre() abort
    cnoremap <expr>;; pum#visible() ? '<Cmd>call pum#map#confirm()<CR>':''
    cnoremap <expr> <Tab>
        \ pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>':
        \ ddc#manual_complete()
    cnoremap <expr> <S-Tab>
        \ pum#visible() ? '<Cmd>call pum#map#insert_relative(-1)<CR>':
        \ ddc#manual_complete()
    cnoremap <C-n>   <Cmd>call pum#map#select_relative(+1)<CR>
    cnoremap <C-p>   <Cmd>call pum#map#select_relative(-1)<CR>
    cnoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
    cnoremap <C-e>   <Cmd>call pum#map#cancel()<CR>

    " Overwrite sources
    if !exists('b:prev_buffer_config')
        let b:prev_buffer_config = ddc#custom#get_buffer()
    endif

    call ddc#custom#patch_buffer('cmdlineSources',
            \ ['cmdline', 'cmdline-history','around'])

    autocmd User DDCCmdlineLeave ++once call CommandlinePost()
    autocmd InsertEnter <buffer> ++once call CommandlinePost()

    " Enable command line completion
    call ddc#enable_cmdline_completion()
endfunction

function! CommandlinePost() abort
    " Restore sources
    if exists('b:prev_buffer_config')
        call ddc#custom#set_buffer(b:prev_buffer_config)
        unlet b:prev_buffer_config
    else
        call ddc#custom#set_buffer({})
    endif
endfunction