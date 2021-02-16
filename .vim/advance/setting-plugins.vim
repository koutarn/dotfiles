"====================================================================
"Vim start up
"====================================================================
    " autocmd VimEnter *
    "             \   if !argc()
    "             \ |   NERDTree
    "             \ |   wincmd w
    "             \ | endif

"====================================================================
"Vim Plug auto load
"====================================================================
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


"====================================================================
"Lokaltog/vim-easymotion
"====================================================================
let g:EasyMotion_do_mapping = 0 " Disale default mappings
let g:EasyMotion_keys='hjklasdfgyuiopwertnmzxcv'
let g:EasyMotion_grouping=1
"Jump to first match with enter & space
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1

"smartcase
let g:EasyMotion_smartcase = 1


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
"osyo-manga/vim-operator-search
"====================================================================
nmap F <Plug>(operator-search)

"====================================================================
"vimtaku/vim-operator-mdurl
"====================================================================
map L <Plug>(operator-mdurl)


let g:asyncomplete_auto_popup = 0
let g:asyncomplete_auto_popup_delay = 200
let g:asyncomplete_auto_completeopt = 0

