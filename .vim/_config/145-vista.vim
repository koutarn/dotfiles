UsePlugin 'vista.vim'
"==================================
"'liuchengxu/vista.vim'
"==================================
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
let g:view#renderer#enable_icon = 1

let g:vista_sidebar_width = 40
let g:vista_sidebar_open_cmd = '40vsplit'
let g:vista_echo_cursor = 0
let g:vista_cursor_delay = 100
" let g:vista_no_mappings = 1

let g:vista_highlight_whole_line = 0

let g:vista_executive_for = {
    \ 'c': 'coc',
    \ 'h': 'coc',
    \ 'cpp': 'coc',
    \ 'php': 'coc',
    \ 'txt': 'markdown',
    \ 'markdown': 'toc',
    \ }

augroup vimrc_vista
  autocmd!
  autocmd Filetype vista nnoremap <buffer>o :<C-U>call vista#cursor#FoldOrJump()<CR>
  autocmd Filetype vista nnoremap <buffer>q :<C-u>close<CR>
augroup END


