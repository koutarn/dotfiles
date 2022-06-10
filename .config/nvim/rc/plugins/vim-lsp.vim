UsePlugin 'vim-lsp'
function! s:on_lsp_buffer_enabled() abort

    if &filetype ==# 'ddu-ff'
        return
    endif

    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes

    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif

    " nmap <buffer> zz <plug>(lsp-implementation)
    nmap <buffer> z[ <plug>(lsp-definition)
    nmap <buffer> z] <plug>(lsp-references)
    nmap <buffer> z= <plug>(lsp-document-diagnostics)
    nmap <buffer> z- <plug>(lsp-workspace-symbol)
    nmap <buffer> z\ <plug>(lsp-document-symbol)
    nmap <buffer> zh <plug>(lsp-hover)
    nmap <buffer> zH <plug>(lsp-hover-preview)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)
    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs call execute('LspDocumentFormatSync')

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
let g:lsp_diagnostics_signs_enabled = 1
let g:lsp_document_highlight_enabled = 1

"sing
let g:lsp_diagnostics_signs_error = {'text': '👾'}
let g:lsp_diagnostics_signs_warning = {'text': '👻'}
let g:lsp_diagnostics_signs_hint = {'text': '💡'}

"ログを無効化
let g:lsp_log_file = """"
let g:lsp_log_verbose = 0
