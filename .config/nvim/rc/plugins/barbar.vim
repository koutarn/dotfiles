UsePlugin 'barbar.nvim'
" Magic buffer-picking mode
nnoremap <Leader>q <Cmd>BufferClose!<CR>

" Move to previous/next
nnoremap <silent><Leader>y <Cmd>BufferPrevious<CR>
nnoremap <silent><Leader>u <Cmd>BufferNext<CR>

if !exists('bufferline')
  let bufferline = {}
endif

let bufferline.shadow = v:true
let bufferline.animation = v:false
let bufferline.icons = 'buffer_number_with_icon'
let bufferline.closable = v:false
let bufferline.clickable = v:false
let bufferline.semantic_letters = v:false 
let bufferline.maximum_padding = 0
let g:bufferline.maximum_length = 15

" " romgrk/doom-one.vim
" function! s:barbar_highlight_doom()
"     highlight BufferCurrent guifg=#E6E6E6 guibg=#282c34
"     highlight BufferCurrentIndex guifg=#73797e guibg=#282c34
"     highlight BufferCurrentMod guifg=#ECBE7B guibg=#282c34
"     highlight BufferCurrentSign guifg=#51afef guibg=#282c34
"     highlight BufferCurrentTarget gui=bold guifg=#ff6c6b guibg=#282c34
"     highlight BufferVisible guifg=#E6E6E6 guibg=#282c34
"     highlight BufferVisibleIndex guifg=#E6E6E6 guibg=#282c34
"     highlight BufferVisibleMod guifg=#ECBE7B guibg=#282c34
"     highlight BufferVisibleSign guifg=#3f444a guibg=#282c34
"     highlight BufferVisibleTarget gui=bold guifg=#ff6c6b guibg=#282c34
"     highlight BufferInactive guifg=#73797e guibg=#1c1f24
"     highlight BufferInactiveIndex guifg=#73797e guibg=#1c1f24
"     highlight BufferInactiveMod guifg=#ECBE7B guibg=#1c1f24
"     highlight BufferInactiveSign guifg=#3f444a guibg=#1c1f24
"     highlight BufferInactiveTarget gui=bold guifg=#ff6c6b guibg=#1c1f24
"     highlight BufferTabpages gui=bold guifg=#51afef guibg=#3E4556
"     highlight BufferTabpageFill gui=bold guifg=#3f444a guibg=#1c1f24
" endfunction

augroup vimrc_barbar
  autocmd!
  autocmd TermOpen * setlocal nobuflisted
  autocmd FileType qf setlocal nobuflisted
  " autocmd ColorScheme * call s:barbar_highlight_doom()
augroup END
