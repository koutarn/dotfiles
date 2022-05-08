UsePlugin 'clever-f.vim'

"smart case
let g:clever_f_smart_case = 1

"migemo
let g:clever_f_use_migemo = 1

"任意の記号にマッチさせる
let g:clever_f_char_match_any_signs = ';'

"行をまたがない
let g:clever_f_across_no_line = 1

"強調表示
let g:clever_f_mark_direct = 0
let g:clever_f_mark_cursor = 0
let g:clever_f_mark_char = 1
let g:clever_f_mark_char_color = 'CleverFDefaultLabel'

augroup vimrc_cleverf
    autocmd ColorScheme * highlight default CleverFDefaultLabel ctermfg=red ctermbg=NONE cterm=bold,underline guifg=red guibg=NONE gui=bold,underline
augroup END
highlight default CleverFDefaultLabel ctermfg=red ctermbg=NONE cterm=bold,underline guifg=red guibg=NONE gui=bold,underline
