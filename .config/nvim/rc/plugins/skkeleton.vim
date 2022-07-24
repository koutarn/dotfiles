UsePlugin 'skkeleton'
"=======================
"'vim-skk/skkeleton'
"=======================
imap jk <Plug>(skkeleton-toggle)
cmap jk <Plug>(skkeleton-toggle)
autocmd User skkeleton-mode-changed redrawstatus

call skkeleton#config({
\ 'globalJisyo': '~/.config/SKK-JISYO.L',
\ 'eggLikeNewline': v:true,
\ 'registerConvertResult': v:true,
\ 'markerHenkan': '@',
\ 'markerHenkanSelect': '@',
\ })

call skkeleton#register_kanatable('rom', {
    \ 'jj': 'escape',
\ })
