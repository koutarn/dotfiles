UsePlugin 'gina.vim'
"====================================================================
" lambdalisue/gina.vim'
"====================================================================
noremap <leader>gl :Gina log<CR>
nnoremap <leader>ga :Gina add -A<CR>
nnoremap <leader>gc :Gina commit -m ''<Left>
nnoremap <leader>gp :Gina push origin master<CR>
nnoremap <leader>gs :Gina status<CR>
nnoremap <leader>gd :Gina diff<CR>
