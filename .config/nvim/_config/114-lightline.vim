UsePlug 'lightline.vim'
"=============================
"'itchyny/lightline.vim'
"=============================
" let g:lightline = {'colorscheme' : 'tokyonight'}

let g:lightline = {
\ 'colorscheme': 'edge',
\ 'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
\ },
\ 'component_function': {
\   'cocstatus': 'coc#status'
\ },
\ }
