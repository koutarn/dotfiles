UsePlugin 'i3config.vim'
"==================================
"mboughaba/i3config.vim
"==================================
augroup vimrc_i3config
  autocmd!
  autocmd BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
augroup end
