" UsePlug 'vim-skk/skkeleton'
"=======================
"'vim-skk/skkeleton'
"=======================
imap jk <Plug>(skkeleton-toggle)
cmap jk <Plug>(skkeleton-toggle)

call skkeleton#config({
\ 'globalJisyo': '~/.config/SKK-JISYO.L',
\ 'eggLikeNewline': v:true,
\ 'registerConvertResult': v:true,
\ 'markerHenkan': '[H]',
\ 'markerHenkanSelect': '[S]',
\ })

call skkeleton#register_kanatable('rom', {
      \ 'jj': 'escape',
      \ })
