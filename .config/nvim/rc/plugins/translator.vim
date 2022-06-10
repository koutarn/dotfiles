UsePlugin 'vim-translator'

" let g:translate_popup_window = 0

" augroup vimrc_translate
"     autocmd!
"     autocmd Filetype help,qf nnoremap <buffer><Leader><Leader> <Cmd>Translate<CR>
"     autocmd Filetype help,qf vnoremap <buffer><Leader> :Translate<CR>
"     autocmd Filetype translate nnoremap <buffer><silent> q :<C-u>close<CR>
" augroup END

" let g:vtm_target_lang = 'ja'
let g:translator_target_lang = 'ja'
" let g:translator_default_engines = 'google'
