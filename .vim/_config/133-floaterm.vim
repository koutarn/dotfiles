UsePlugin 'vim-floaterm'
"==================================
"voldikss/vim-floaterm
"==================================

let g:floaterm_title = 'terminal'
let g:floaterm_height = 0.6
let g:floaterm_width = 0.6

nnoremap   <silent><leader>to   :FloatermToggle<CR>
augroup vimrc_floaterm
  autocmd!
  autocmd User FloatermOpen tnoremap <buffer> <silent> <Esc> <Cmd>FloatermToggle<CR>
  autocmd VimEnter,ColorScheme * highlight FloatermBorder guibg=#282c34 guifg=LightGray
  autocmd QuitPre * FloatermKill!
augroup END
