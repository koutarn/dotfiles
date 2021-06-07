UsePlugin 'gina.vim'
"====================================================================
" lambdalisue/gina.vim'
"====================================================================
noremap <leader>gl <Cmd>Gina log<CR>
nnoremap <leader>ga <Cmd>Gina add -A<CR>
nnoremap <leader>gc <Cmd>Gina commit -m ''<Left>
nnoremap <leader>gp <Cmd>Gina push origin master<CR>
nnoremap <leader>gs <Cmd>Gina status<CR>
nnoremap <leader>gd <Cmd>Gina diff<CR>
