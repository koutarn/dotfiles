UsePlugin 'open-browser.vim'
" ================================
" Plug 'tyru/open-browser.vim'
" ================================
"open-browser.vim
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap go <Plug>(openbrowser-smart-search)
vmap go <Plug>(openbrowser-smart-search)
nnoremap gO :<C-u>OpenBrowserSearch 
