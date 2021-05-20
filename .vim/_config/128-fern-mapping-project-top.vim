UsePlugin 'fern-mapping-project-top.vim'
" ===========================================
" 'lambdalisue/fern-mapping-project-top.vim'
" ===========================================

function! s:init_fern_project_top()
  nmap <buffer> <Plug>(fern-project-top-and-tcd)
        \ <Plug>(fern-action-project-top)
        \ <Plug>(fern-wait)
        \ <Plug>(fern-action-tcd:root)

  nmap <buffer> ~ <Plug>(fern-project-top-and-tcd)

endfunction

augroup my-fern-project-top
  autocmd FileType fern call s:init_fern_project_top()

augroup END
