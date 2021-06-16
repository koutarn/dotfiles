UsePlugin 'translate.vim'
"==================================
"skanehira/translate.vim
"==================================
let g:translate_popup_window = 0
nnoremap <Leader>tr <Cmd>Translate<CR>
vnoremap <Leader>tr :Translate<CR>

augroup vimrc_translate
    autocmd!
    autocmd Filetype translate nnoremap <buffer><silent> q :<C-u>close<CR>
augroup END
