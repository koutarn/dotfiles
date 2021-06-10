UsePlugin 'gina.vim'
"====================================================================
" lambdalisue/gina.vim'
"====================================================================
noremap <leader>gl :Gina log
nnoremap <leader>ga :Gina add -A
nnoremap <leader>gc :Gina commit -m ''<Left>
nnoremap <leader>gp :Gina push origin master
nnoremap <leader>gs :Gina status
nnoremap <leader>gd :Gina diff
