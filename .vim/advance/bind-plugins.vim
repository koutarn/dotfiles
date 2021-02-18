"====================================================================
"'godlygeek/tabular'
"====================================================================
vmap <Leader><Leader> :Tabularize /

"====================================================================
"mhinz/vim-sayonara
"====================================================================
"バッファを削除
nnoremap sx :Sayonara!<cr>:bnext<cr>

"====================================================================
"t9md/vim-quickhl
"====================================================================
nmap <Space>m <Plug>(quickhl-manual-this)
" xmap <Space><Space> <Plug>(quickhl-manual-this)
nmap <ESC><ESC> :noh<CR><Plug>(quickhl-manual-reset)
"xmap <ESC><ESC> <Plug>(quickhl-manual-reset)

"====================================================================
"rhysd/vim-operator-surround
"====================================================================
map <silent>sa <Plug>(operator-surround-append)
map <silent>sd <Plug>(operator-surround-delete)<Plug>(textobj-anyblock-a)
map <silent>sr <Plug>(operator-surround-replace)<Plug>(textobj-anyblock-a)
"====================================================================
" kana/vim-textobj-function
"====================================================================
let g:textobj_function_no_default_key_mappings=0
omap iF <Plug>(textobj-function-i)
omap aF <Plug>(textobj-function-a)
vmap iF <Plug>(textobj-function-i)
vmap aF <Plug>(textobj-function-a)
"====================================================================
"kana/vim-operator-replace
"====================================================================
nmap R <Plug>(operator-replace)

"====================================================================
"mg979/vim-visual-multi
"====================================================================
let g:VM_default_mappings          = 0
let g:VM_mouse_mappings             = 1
let g:VM_leader                     = ';'
let g:VM_theme                      = 'neon'
let g:VM_maps                       = {}
let g:VM_manual_infoline            = 0
let g:VM_maps['Find Subword Under'] = '<C-n>'
let g:VM_maps['Find Under']         = '<C-n>'
let g:VM_maps["Add Cursor Up"]      = '<C-k>'
let g:VM_maps["Select l"]           = '<C-l>'
let g:VM_maps["Select h"]           = '<C-h>'
let g:VM_maps["Add Cursor Down"]    = '<C-j>'
let g:VM_maps["Add Cursor At Pos"]  = '<Leader>n'
let g:VM_maps["Increase"]           = '<Up>'
let g:VM_maps["Decrease"]           = '<Down>'
let g:VM_maps["J"]                  = 'M-j'
