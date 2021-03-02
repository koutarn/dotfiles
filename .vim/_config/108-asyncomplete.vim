UsePlugin 'asyncomplete.vim'
"====================================================================
"prabirshrestha/asyncomplete.vim
"====================================================================
let g:asyncomplete_enable_for_all = 0
autocmd vimrc FileType autohotkey,autoit,cfg,git,go,groovy,java,javascript,python,snippet,toml,vim,vb,xsl,md call asyncomplete#enable_for_buffer()

let g:asyncomplete_auto_popup = 0
let g:asyncomplete_auto_popup_delay = 200
let g:asyncomplete_auto_completeopt = 0
let g:asyncomplete_min_chars = 4

" noremap <expr> <C-j>   pumvisible() ? "\<C-n>" : "<C-j>"
" inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "<C-k>"
" inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
