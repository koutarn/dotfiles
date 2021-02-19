UsePlugin 'vim-operator-surround'

"====================================================================
"rhysd/vim-operator-surround
"====================================================================
map <silent>sa <Plug>(operator-surround-append)
map <silent>sd <Plug>(operator-surround-delete)<Plug>(textobj-anyblock-a)
map <silent>sr <Plug>(operator-surround-replace)<Plug>(textobj-anyblock-a)
