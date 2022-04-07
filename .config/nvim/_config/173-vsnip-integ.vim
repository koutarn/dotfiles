UsePlugin 'vim-vsnip-integ'

if jetpack#tap('pum.vim')
    autocmd User PumCompleteDone call vsnip_integ#on_complete_done(g:pum#completed_item)
endif
