UsePlugin 'vim-lsp'
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes

    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif

    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> g;: <Cmd>LspWorkspaceSymbol<CR>
    nmap <buffer> g;; <Cmd>LspDocumentSymbol<CR>
    nmap <buffer> gh <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)
    " let g:lsp_format_sync_timeout = 1000
    " autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
au!
" call s:on_lsp_buffer_enabled only for languages that has the server registered.
autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

"vim-lspのsignature_helpを無効化する
let g:lsp_signature_help_enabled = 0
let g:lsp_diagnostics_enabled = 1

"diagnoticsを無効化
let g:lsp_diagnostics_signs_enabled = 1
let g:lsp_document_highlight_enabled = 0

"sing
" let g:lsp_signs_error = {'text': 'E'}
" let g:lsp_signs_warning = {'text': 'W'}

"ログを無効化
let g:lsp_log_file = """"
let g:lsp_log_verbose = 0
