UsePlugin 'vim-cheatsheet'
"==================================
"reireias/vim-cheatsheet
"==================================

nnoremap <Leader>? <Cmd>Cheat<CR>
command! EditCheat edit ~/.config/nvim/cheatsheet
let g:cheatsheet#cheat_file = '~/.config/nvim/cheatsheet'

let g:cheatsheet#float_window = 1
let g:cheatsheet#float_window_width_ratio = 0.8
let g:cheatsheet#float_window_height_ratio = 0.7
