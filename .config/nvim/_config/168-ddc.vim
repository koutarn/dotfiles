" UsePlug 'Shougo/ddc.vim'

"保管を出すイベント
call ddc#custom#patch_global('autoCompleteEvents', [
\ 'InsertEnter', 'TextChangedI', 'TextChangedP',
\ 'CmdlineEnter', 'CmdlineChanged',
\ ])

"pum.vimを使用
call ddc#custom#patch_global('completionMenu', 'pum.vim')

"skkeletonは別枠で設定しておく
call ddc#custom#patch_global('sources','skkeleton')

"sourcesの設定
call ddc#custom#patch_global('sources', [
 \ 'around',
 \ 'vim-lsp',
 \ 'file'
 \ ])

call ddc#custom#patch_global('sourceOptions', {
 \ '_': {
 \   'matchers': ['matcher_fuzzy'],
 \   'sorters': ['sorter_rank'],
 \   'converters': ['converter_remove_overlap'],
 \ },
 \ 'around': {'mark': 'Around'},
 \ 'vim-lsp': {
 \   'mark': 'LSP',
 \   'forceCompletionPattern': '\.|:|->|"\w+/*'
 \ },
 \   'skkeleton': {
 \     'mark': 'skk',
 \     'matchers': ['skkeleton'],
 \     'sorters': [],
 \     'minAutoCompleteLength': 1,
 \   },
 \ 'file': {
 \   'mark': 'file',
 \   'isVolatile': v:true,
 \   'forceCompletionPattern': '\S/\S*'
 \ }})

call ddc#enable()

inoremap <expr>;; pum#visible() ? '<Cmd>call pum#map#confirm()<CR>':''

inoremap <C-n>   <Cmd>call pum#map#select_relative(+1)<CR>
inoremap <C-p>   <Cmd>call pum#map#select_relative(-1)<CR>
inoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
inoremap <C-e>   <Cmd>call pum#map#cancel()<CR>

"command line completion
nnoremap ; <Cmd>call CommandlinePre()<CR>:

function! CommandlinePre() abort
    " Note: It disables default command line completion!
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
    let s:prev_buffer_config = ddc#custom#get_buffer()
    call ddc#custom#patch_buffer('sources',
        \ ['cmdline', 'cmdline-history', 'around'])

    call ddc#custom#patch_buffer('sourceOptions', {
    \ '_': {
    \   'matchers': ['matcher_fuzzy'],
    \   'sorters': ['sorter_rank'],
    \   'converters': ['converter_remove_overlap'],
    \ },
    \ 'cmdline': {'mark': 'cmdline'},
    \ 'cmdline-history': {'mark': 'cmd-histroy'},
    \ 'around': {'mark': 'Around'},
    \ })

    autocmd User DDCCmdlineLeave ++once call CommandlinePost()

    " Enable command line completion
    call ddc#enable_cmdline_completion()
    call ddc#enable()
endfunction

function! CommandlinePost() abort
    " Restore source
    call ddc#custom#set_buffer(s:prev_buffer_config)
    cunmap <Tab>
endfunction


call ddc#enable()
