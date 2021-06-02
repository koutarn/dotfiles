UsePlugin 'vim-quickhl'
"==================================
"t9md/vim-quickhl
"==================================
let g:quickhl_manual_keywords = [
\  { 'pattern': '\C\<\(TODO\|FIXME\|NOTE\|INFO\)\>', 'regexp': 1 },
\]
let g:quickhl_manual_enable_at_startup = 1

UsePlugin 'vim-quickhl'
"====================================================================
"t9md/vim-quickhl
"====================================================================
nmap <Space>m <Plug>(quickhl-manual-this)
vmap <Space>m <Plug>(quickhl-manual-this)
nmap <ESC><ESC> <Plug>(quickhl-manual-reset)
