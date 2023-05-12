
"==================================
"'liuchengxu/vista.vim'
"==================================
let g:vista_icon_indent = ['└ ', '│ ']
let g:vista_default_executive = 'vim_lsp'
let g:vista_fzf_preview = ['right:40%']
let g:view#renderer#enable_icon = 1

let g:vista_sidebar_width = 40
let g:vista_sidebar_open_cmd = '40vsplit'
let g:vista_echo_cursor = 0
let g:vista_cursor_delay = 100
" let g:vista_no_mappings = 1
let g:vista_disable_statusline = 1
let g:vista_blink = [1,100]
let g:vista_top_level_blink = [1, 100]
let g:vista_highlight_whole_line = 0
let g:vista#finders = ['fzf']
let g:vista_executive_for = {
    \ 'c': 'vim_lsp',
    \ 'h': 'vim_lsp',
    \ 'cpp': 'vim_lsp',
    \ 'php': 'vim_lsp',
    \ 'txt': 'markdown',
    \ 'markdown': 'toc',
    \ }

augroup vimrc_vista
  autocmd!
  autocmd Filetype vista,vista_kind,vista_markdown nnoremap <buffer>o <Cmd>call vista#cursor#FoldOrJump()<CR>
  autocmd Filetype vista,vista_kind,vista_markdown nnoremap <buffer>q <Cmd>close<CR>
augroup END

nnoremap <silent><Leader>fv <Cmd>Vista<CR>
