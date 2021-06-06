UsePlugin 'gina.vim'
"====================================================================
" lambdalisue/gina.vim'
"====================================================================
nnoremap <leader>gl :<C-u>Gina log<CR>
nnoremap <leader>ga :<C-u>Gina add -A<CR>
nnoremap <leader>gc :<C-u>Gina commit -m ''<Left>
nnoremap <leader>gp :<C-u>Gina push origin master<CR>
nnoremap <leader>gs :<C-u>Gina status<CR>
nnoremap <leader>gd :<C-u>Gina diff<CR>

" "sheeplaさんのをパクった、thx(https://vim-jp.org/reading-vimrc/archive/466.html) 
" cabbrev gstatus Gina<Space>status
" cabbrev gcommit Gina<Space>commit
" cabbrev glog Gina<Space>log
" cabbrev ggrep Gina<Space>grep
" cabbrev gls Gina<Space>ls
" cabbrev gdiff Gina<Space>diff
" cabbrev gshow Gina<Space>show
