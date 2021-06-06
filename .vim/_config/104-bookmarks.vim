UsePlugin 'vim-bookmarks'
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
nmap <silent><leader>mm <Plug>BookmarkToggle
nmap <silent><leader>mi <Plug>BookmarkAnnotate
nmap <silent><leader>ma <Plug>BookmarkShowAll
nmap <silent><leader>mw <Plug>BookmarkNext
nmap <silent><leader>mb <Plug>BookmarkPrev
nmap <silent><leader>mx <Plug>BookmarkClear
nmap <silent><leader>md <Plug>BookmarkClearAll
