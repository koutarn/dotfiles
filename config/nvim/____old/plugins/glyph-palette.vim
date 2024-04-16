
"=================================
"'lambdalisue/glyph-palette.vim'
"=================================
" アイコンに色をつける
augroup vimrc_glyph_palette
  autocmd!
  autocmd FileType fern call glyph_palette#apply()
augroup END
