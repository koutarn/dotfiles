"====================================================================
"Vim Plug auto load
"====================================================================
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"====================================================================
"luochen1990/rainbow
"====================================================================
let g:rainbow_active = 1
"au ColorScheme * RainbowToggleOn
let g:rainbow_conf = {
	\	'guifgs': ['green','lightmagenta','yellow','cyan','red'],
	\	'ctermfgs': ['green','lightmagenta','yellow','cyan','red'], 
  \ 'parentheses': ['start=/(/ end=/)/ fold']
  \}

"====================================================================
"ap/vim-buftabline
"====================================================================
let g:buftabline_indicators = 1
let g:buftabline_plug_max   = 0
let g:buftabline_separators = 0

"====================================================================
"scrooloose/nerdcommenter
"====================================================================
let g:NERDSpaceDelims            = 1
let g:NERDCompactSexyComs        = 1
let g:NERDDefaultAlign           = 'left'
let g:NERDAltDelims_java         = 1
let g:NERDCommentEmptyLines      = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines    = 1
let g:NERDCreateDefaultMappings  = 1

"====================================================================
"mg979/vim-bookmarks
"====================================================================
let g:bookmark_auto_save = 0
"let g:bookmark_save_per_working_dir=1
let g:bookmark_no_default_key_mappings = 1
let g:bookmark_show_toggle_warning = 0
let g:bookmark_show_warning = 0

"key_mappings
silent! nmap mm <Plug>BookmarkToggle
silent! nmap mi <Plug>BookmarkAnnotate
silent! nmap ma <Plug>BookmarkShowAll
silent! nmap mw <Plug>BookmarkNext
silent! nmap mb <Plug>BookmarkPrev
nmap mx <Plug>BookmarkClear
nmap md <Plug>BookmarkClearAll

"====================================================================
"prabirshrestha/asyncomplete.vim
"====================================================================
let g:asyncomplete_enable_for_all = 0
autocmd vimrc FileType autohotkey,autoit,cfg,git,go,groovy,java,javascript,python,snippet,toml,vim,vb,xsl,md call asyncomplete#enable_for_buffer()

let g:asyncomplete_auto_popup = 0
let g:asyncomplete_auto_popup_delay = 200
let g:asyncomplete_auto_completeopt = 0
let g:asyncomplete_min_chars = 4

noremap <expr> <C-j>   pumvisible() ? "\<C-n>" : "<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "<C-k>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
