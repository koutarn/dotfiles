
"====================================================================
"mg979/vim-bookmarks
"====================================================================
"settings
let g:bookmark_auto_save = 0
"let g:bookmark_save_per_working_dir=1
let g:bookmark_no_default_key_mappings = 1
let g:bookmark_show_toggle_warning = 0
let g:bookmark_show_warning = 0

"sign
let g:bookmark_sign = '🔖'
let g:bookmark_annotation_sign = '🪧'

"key mappings
nmap <silent><Leader>mm <Plug>BookmarkToggle
nmap <silent><Leader>mi <Plug>BookmarkAnnotate
nmap <silent><Leader>ma <Plug>BookmarkShowAll
nmap <silent><Leader>mw <Plug>BookmarkNext
nmap <silent><Leader>mb <Plug>BookmarkPrev
nmap <silent><Leader>mx <Plug>BookmarkClear
nmap <silent><Leader>md <Plug>BookmarkClearAll
