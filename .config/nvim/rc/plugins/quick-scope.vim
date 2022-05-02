UsePlugin 'quick-scope'

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:qs_buftype_blacklist = ['help','quickfix','terminal', 'nofile','fern','ddu-ff']
let g:qs_lazy_highlight = 1

augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='LightGreen' gui=underline,italic ctermfg=155 cterm=underline,italic
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='Cyan' gui=underline,italic ctermfg=81 cterm=underline,italic
augroup END
