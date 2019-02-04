"====================================================================
"Vim start up
"====================================================================
    autocmd VimEnter *
                \   if !argc()
                \ |   NERDTree
                \ |   wincmd w
                \ | endif


"====================================================================
"Vim Plug auto load
"====================================================================
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"====================================================================
" tcomment.vim
"====================================================================
" tcommentで使用する形式を追加
if !exists('g:tcomment_types')
  let g:tcomment_types = {}
endif
let g:tcomment_types = {
      \'c_' : "/* ++[%s] */",
      \}
function! CComment()
  nmap <buffer> <Leader>c :TCommentAs c_<CR>
  vmap <buffer> <Leader>c :TCommentAs c_<CR>
endfunction

au FileType c call CComment()  " 業務用のコメント

"====================================================================
"vim-scripts/wimproved.vim
"====================================================================
autocmd GUIEnter * silent! WToggleClean
autocmd GUIEnter * silent! WCenter 80
"autocmd GUIEnter * silent! WToggleFullscreen

"====================================================================
"yankround.vim
"====================================================================
let g:yankround_max_history = 50 "履歴取得数

"====================================================================
"AutoComplPop
"====================================================================
let g:acp_behaviorKeywordLength = 1
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
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_uit_key             = '<Esc>'
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
let g:nerdtree_tabs_open_on_console_startup = 1

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
let g:indentLine_enabled    = 1
let g:indentLine_faster     = 1
let g:indentLine_char       = '⎸'
let g:indentLine_color_term = 244
"====================================================================
"Xuyuanp/nerdtree-git-plugin
"====================================================================
let g:NERDTreeIndicatorMapCustom = {
      \ "Modified"  : "✹",
      \ "Staged"    : "✚",
      \ "Untracked" : "✭",
      \ "Renamed"   : "➜",
      \ "Unmerged"  : "═",
      \ "Deleted"   : "✖",
      \ "Dirty"     : "✗",
      \ "Clean"     : "✔︎",
      \ 'Ignored'   : '☒',
      \ "Unknown"   : "?"
      \ }

"====================================================================
"nathanaelkane/vim-indent-guides
"====================================================================
let g:indent_guides_enable_on_vim_startup = 1
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
      \ 'colorscheme': 'material',
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

