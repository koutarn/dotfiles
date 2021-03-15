UsePlugin 'open-browser.vim'
" ================================
" Plug 'tyru/open-browser.vim'
" ================================
"open-browser.vim
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nnoremap gx <Plug>(openbrowser-smart-search)
vnoremap gx <Plug>(openbrowser-smart-search)
