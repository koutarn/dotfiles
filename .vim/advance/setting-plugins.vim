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
"vim-scripts/wimproved.vim
"====================================================================
if has('win32') || has('win64')
  autocmd GUIEnter * silent! WToggleClean
  autocmd GUIEnter * silent! WCenter 60
  "autocmd GUIEnter * silent! WToggleFullscreen
endif

"====================================================================
"yankround.vim
"====================================================================
"let g:yankround_max_history = 50 "履歴取得数

"====================================================================
"AutoComplPop
"====================================================================
"let g:acp_behaviorKeywordLength = 1

"====================================================================
"Shougo/neocomplete.vim
"====================================================================
let g:acp_enableAtStartup                           = 0  " AutoComplPop無効化
let g:neocomplete#enable_at_startup                 = 1  " neocompleteの使用
let g:neocomplete#enable_smart_case                 = 1  " Use smartcase.
let g:neocomplete#max_list                          = 20 " ポップアップメニューで表示される候補の数
let g:neocomplete#sources#syntax#min_keyword_length = 3  " シンタックスをキャッシュするときの最小文字長
let g:neocomplete#auto_completion_start_length      = 2  " 補完を表示する最小文字数

"_(アンダースコア)区切りの補完を有効化
let g:neocomplete#enable_underbar_completion = 1
let g:neocomplete#enable_camel_case_completion  =  1

"preview window を閉じない
let g:neocomplete#enable_auto_close_preview = 0
autocmd InsertLeave * silent! pclose!
let g:neocomplete#max_keyword_width = 10000

"Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
        \ }
if !exists('g:neocomplete#text_mode_filetypes')
    let g:neocomplete#text_mode_filetypes = {}
endif

"Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif

let g:neocomplete#keyword_patterns['default'] = '\h\w*'

"====================================================================
"'thinca/vim-fontzoom'
"====================================================================
let g:fontzoom_no_default_key_mappings = 1

"====================================================================
"Lokaltog/vim-easymotion
"====================================================================
let g:EasyMotion_do_mapping = 0 " Disale default mappings

"ホームポジションに近いキーを使う
let g:EasyMotion_keys='hjklasdfgyuiopwertnmzxcv'

"1 ストローク選択を優先する
let g:EasyMotion_grouping=1

"Jump to first match with enter & space
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1

"smartcase
let g:EasyMotion_smartcase = 1

 "====================================================================
"honza/vim-snippets
"====================================================================
let g:minisnip_trigger = '<C-l>' "keymapの変更

"====================================================================
"terryma/vim-multiple-cursors
"====================================================================
"let g:multi_cursor_use_default_mapping=0
"let g:multi_cursor_start_word_key      = '<C-n>'
"let g:multi_cursor_select_all_word_key = '<A-n>'
"let g:multi_cursor_start_key           = 'g<C-n>'
"let g:multi_cursor_select_all_key      = 'g<A-n>'
"let g:multi_cursor_next_key            = '<C-n>'
"let g:multi_cursor_prev_key            = '<C-p>'
"let g:multi_cursor_skip_key            = '<C-x>'
"let g:multi_cursor_quit_key            = '<Esc>'
"
"function! Multiple_cursors_before()
"  if exists(':NeoCompleteLock')==2
"    exe 'NeoCompleteLock'
"  endif
"endfunction
"
"function! Multiple_cursors_after()
"  if exists(':NeoCompleteUnlock')==2
"    exe 'NeoCompleteUnlock'
"  endif
"endfunction

"====================================================================
"kannokanno/previm
"====================================================================
autocmd BufRead,BufNewFile *.mkd  set filetype=markdown
autocmd BufRead,BufNewFile *.md  set filetype=markdown

"Ctrl-pでプレビュー
nnoremap <silent> <C-p> :PrevimOpen<CR>

"自動で折りたたまないようにする
let g:vim_markdown_folding_disabled=1
let g:previm_enable_realtime = 1
"====================================================================
"scrooloose/nerdtree
"====================================================================
"NERDtreeを自動で有効にする
let g:nerdtree_tabs_open_on_console_startup = 0
let g:NERDTreeLimitedSyntax = 1

"NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='.a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'.a:extension .'$#'
endfunction

call NERDTreeHighlightFile('py',     'yellow',  'none', 'yellow','#151515')
call NERDTreeHighlightFile('md',     'blue',    'none', '#3366FF','#151515')
call NERDTreeHighlightFile('yml',    'yellow',  'none', 'yellow','#151515')
call NERDTreeHighlightFile('config', 'yellow',  'none', 'yellow','#151515')
call NERDTreeHighlightFile('conf',   'yellow',  'none', 'yellow','#151515')
call NERDTreeHighlightFile('json',   'yellow',  'none', 'yellow','#151515')
call NERDTreeHighlightFile('html',   'yellow',  'none', 'yellow','#151515')
call NERDTreeHighlightFile('styl',   'cyan',    'none', 'cyan','#151515')
call NERDTreeHighlightFile('css',    'cyan',    'none', 'cyan', '#151515')
call NERDTreeHighlightFile('rb',     'Red',     'none', 'red','#151515')
call NERDTreeHighlightFile('js',     'Red',     'none', '#ffa500','#151515')
call NERDTreeHighlightFile('php',    'Magenta', 'none', '#ff00ff','#151515')
call NERDTreeHighlightFile('vim',    'Magenta', 'none', '#ff00ff','#151515')

let g:NERDTreeDirArrowExpandable  = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeDirArrows           = 1
let NERDTreeWinSize               = 35

" 不可視ファイルを表示する
let NERDTreeShowHidden=1

"bookmarkの表示
let NERDTreeShowBookmarks=1

let g:nerdtree_tabs_focus_on_files=1
let NERDTreeChDirMode=2
let NERDTreeIgnore = ['.[oa]$', '.(so)$','.(tgz|gz|zip)$','.[sa]$', '.(ss)$',]

"====================================================================
"ryanoasis/vim-devicons
"====================================================================
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding  = ' '
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose        = 1

"====================================================================
"Yggdroot/indentLine
"====================================================================
"let g:indentLine_color_term = 244       "terminal
let g:indentLine_setColors = 1
let g:indentLine_enabled   = 1
let g:indentLine_color_gui = '#A4E57E'  "GVim
let g:indentLine_faster    = 0
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_fileType = ['c', 'cpp']

"====================================================================
"nathanaelkane/vim-indent-guides
"====================================================================
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_color_change_percent = 20
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_default_mapping = 0
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree','vim']
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#0B4C5F   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#0B615E ctermbg=4

"====================================================================
"bronson/vim-trailing-whitespace
"====================================================================
"autocmd BufWritePre * :FixWhitespace "ファイル保存時に余分なスペースを削除する

"====================================================================
"vim-tags
"====================================================================
let g:tagbar_width = 30
let g:tagbar_autoshowtag = 1

"====================================================================
"reireias/vim-cheatsheet
"====================================================================
let g:cheatsheet#cheat_file = '~/.cheatsheet.md'
let g:cheatsheet#vsplit     = 1

"====================================================================
"alvan/vim-closetag
"====================================================================
let g:closetag_filenames = '*.html,*.vue,*.erb,*.php'

if has('unix')
  "base16-vim
  let base16colorspace=256
  if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
  endif
endif

"====================================================================
"lightline
"====================================================================
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'readonly': 'LightLineReadonly',
      \   'modified': 'LightLineModified',
      \   'filename': 'LightLineFilename',
      \   'filetype': 'LightLineFiletype',
      \   'fileformat': 'LightLineFileformat',
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightLineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return ""
  else
    return ""
  endif
endfunction

function! LightLineFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? ''._ : ''
  endif
  return ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) :  ''
endfunction

"====================================================================
"yonchu/accelerated-smooth-scroll
"====================================================================
" let g:ac_smooth_scroll_no_default_key_mappings = 1 "デフォルトマッピングを無効にする (必要なら)
" let g:ac_smooth_scroll_du_sleep_time_msec      = 1  "小さくするとスクロールスピードが上がる

"====================================================================
"kien/ctrlp.vim
"====================================================================
 " デフォルトのマッピングを無効化(default:'<C-p>')
let g:ctrlp_map = '<Nop>'

" 対象ファイル最大数(default:10000)
let g:ctrlp_max_files  = 100000

" キャッシュディレクトリ
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

" キャッシュを終了時に削除しない
let g:ctrlp_clear_cache_on_exit = 0

" CtrlPのウィンドウ最大高さ
let g:ctrlp_match_window = 'max:30'

" 無視するディレクトリ
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|s|o|obj|make)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

"====================================================================
"tacahiroy/ctrlp-funky
"====================================================================
let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_nudists = [ 'c' ]

"====================================================================
"nazo/pt.vim
"====================================================================
let g:pt_highlight=1

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
"pelodelfuego/vim-swoop
"====================================================================
let g:swoopUseDefaultKeyMap      = 0
let g:defaultWinSwoopHeight      = 12
let g:swoopWindowsVerticalLayout = 0

"====================================================================
"icymind/NeoSolarized
"====================================================================
let g:neosolarized_contrast   = "normal"
let g:neosolarized_visibility = "low"

"====================================================================
"jceb/vim-orgmode
"====================================================================
let g:org_indent = 1
let org_prefer_insert_mode = 0

"====================================================================
"RRethy/vim-hexokinase
"====================================================================
" "All available highlighters
" let g:Hexokinase_highlighters = ['sign_column', 'background', 'foreground']
"
" "Enable for all filetypes
" let g:Hexokinase_ftAutoload = ['*']
"
" "Default event to trigger and update
" let g:Hexokinase_refreshEvents = ['BufWritePost']

"====================================================================
"ap/vim-buftabline
"====================================================================
let g:buftabline_indicators = 1
let g:buftabline_plug_max   = 0
let g:buftabline_separators = 0

"====================================================================
"mg979/vim-colortweaks
"====================================================================
let g:colortweaks = {}
let g:colortweaks.cursor = {
\ 'gui':      has('gui_running') || has('nvim'),
\ 'konsole':  0,
\ 'terminal': 0,
\}

let g:colortweaks.cursor.normal  = {'color': 'steelblue', 'shape': 'block', 'blink': 1}
let g:colortweaks.cursor.insert  = {'color': 'green', 'shape': 'ver', 'blink': 1}
let g:colortweaks.cursor.replace = {'color': 'red', 'shape': 'hor', 'blink': 1}
let g:colortweaks.cursor.command = {'color': 'green', 'shape': 'ver', 'blink': 1}
let g:colortweaks.cursor.visual  = {'color': 'steelblue', 'shape': 'block', 'blink': 1}

"====================================================================
"mg979/do.vim
"====================================================================
let g:vimdo_use_default_commands = 1
let g:vimdo_show_filename = 1
let g:vimdo_interactive = 1

"====================================================================
"mg979/vim-studio-dark
"====================================================================
let g:Vsd = {}
let g:Vsd.contrast = 0

"====================================================================
"joshdick/onedark.vim
"====================================================================
let g:onedark_hide_endofbuffer=1

"====================================================================
"'thiagoalessio/rainbow_levels.vim'
"====================================================================
"hi! RainbowLevel0 ctermbg=240 guibg=#fff8dc
"hi! RainbowLevel1 ctermbg=239 guibg=#6b8e23
"hi! RainbowLevel2 ctermbg=238 guibg=#da70d6
"hi! RainbowLevel3 ctermbg=237 guibg=#3a3a3a
"hi! RainbowLevel4 ctermbg=236 guibg=#556b2f
"hi! RainbowLevel5 ctermbg=235 guibg=#262626
"hi! RainbowLevel6 ctermbg=234 guibg=#1c1c1c
"hi! RainbowLevel7 ctermbg=233 guibg=#121212
"hi! RainbowLevel8 ctermbg=232 guibg=#080808

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
let g:bookmark_sign = '🚩'
let g:bookmark_annotation_sign = '♥'
let g:bookmark_auto_save = 1
"let g:bookmark_save_per_working_dir=1
let g:bookmark_no_default_key_mappings = 1
let g:bookmark_show_toggle_warning = 0
let g:bookmark_show_warning = 0
let g:bookmark_auto_save_file = $HOME.'\.vim\bookmarks'

"key_mappings
silent! nmap mm <Plug>BookmarkToggle
silent! nmap mi <Plug>BookmarkAnnotate
silent! nmap ma <Plug>BookmarkShowAll
silent! nmap mw <Plug>BookmarkNext
silent! nmap mb <Plug>BookmarkPrev
nmap mx <Plug>BookmarkClear
nmap md <Plug>BookmarkClearAll

"====================================================================
"justincampbell/vim-eighties
"====================================================================
let g:eighties_enabled = 1
let g:eighties_minimum_width = 100
let g:eighties_extra_width = 0 " Increase this if you want some extra room
let g:eighties_compute = 1 " Disable this if you just want the minimum + extra

"====================================================================
"osyo-manga/vim-operator-search
"====================================================================
nmap F <Plug>(operator-search)

"====================================================================
"vimtaku/vim-operator-mdurl
"====================================================================
map L <Plug>(operator-mdurl)

"====================================================================
"junegunn/limelight.vim
"====================================================================
" require
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_guifg = 'DarkGray'

" お好みで
let g:limelight_default_coefficient = 0.7
"let g:limelight_paragraph_span = 1
let g:limelight_priority = -1
