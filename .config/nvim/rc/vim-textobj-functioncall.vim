UsePlugin 'vim-textobj-functioncall'
"==================================
"machakann/vim-textobj-functioncall
"==================================
let g:textobj_functioncall_no_default_key_mappings = 1
xmap iC <Plug>(textobj-functioncall-innerparen-a)
omap iC <Plug>(textobj-functioncall-innerparen-a)
xmap aC <Plug>(textobj-functioncall-a)
omap aC <Plug>(textobj-functioncall-a)
