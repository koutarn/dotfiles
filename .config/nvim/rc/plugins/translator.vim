UsePlugin 'vim-translator'


augroup vimrc_translate
    autocmd!
    autocmd Filetype help,qf nnoremap <buffer><Leader><Leader> <Cmd>TranslateW<CR>
    autocmd Filetype help,qf vnoremap <buffer><Leader> :TranslateW<CR>
augroup END

let g:translator_target_lang = 'ja'
let g:translator_window_type = 'popup'
let g:translator_window_max_width = &columns
let g:translator_window_max_height = &lines

nnoremap <silent> <Leader>tw <Plug>TranslateW
vnoremap <silent> <Leader>tw <Plug>TranslateWV
nnoremap <silent> <Leader>tr <Plug>TranslateR
vnoremap <silent> <Leader>tr <Plug>TranslateRV
