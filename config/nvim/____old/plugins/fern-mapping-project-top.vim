
" ===========================================
" 'lambdalisue/fern-mapping-project-top.vim'
" ===========================================
function! s:init_fern_project_top()
  nmap <buffer> <Plug>(fern-project-top-and-tcd)
        \ <Plug>(fern-action-project-top)
        \ <Plug>(fern-wait)
        \ <Plug>(fern-action-tcd:root)
  nmap <buffer>T <Plug>(fern-project-top-and-tcd)
endfunction

augroup vimrc_fern_project_top
  autocmd!
  autocmd FileType fern call s:init_fern_project_top()
  " autocmd FileType fern nmap <buffer>~ <Plug>(fern-project-top-and-tcd)
augroup END
