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
"'godlygeek/tabular'
"====================================================================
vmap <Leader><Leader> :Tabularize /

"====================================================================
"Lokaltog/vim-easymotion
"====================================================================

map f <Plug>(easymotion-bd-w)
map sj <Plug>(easymotion-j)
map sk <Plug>(easymotion-k)

let g:EasyMotion_keys                   = 'hjklasdfgyuiopwertnmzxcv' " ホームポジションに近いキーを使う
let g:EasyMotion_grouping               = 1                          " 1 ストローク選択を優先する
let g:EasyMotion_do_mapping             = 0                          " Disale default mappings
let g:EasyMotion_enter_jump_first       = 1                          " Jump to first match with enter & space
let g:EasyMotion_space_jump_first       = 1                          " Jump to first match with enter & space
let g:EasyMotion_smartcase              = 1                          " smartcase

"====================================================================
"'osyo-manga/vim-over'
"====================================================================
"nnoremap <silent>sg :OverCommandLine<CR>%s//<Left>
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

call NERDTreeHighlightFile('py'     , 'yellow'  , 'none' , 'yellow'  , '#151515')
call NERDTreeHighlightFile('md'     , 'blue'    , 'none' , '#3366FF' , '#151515')
call NERDTreeHighlightFile('yml'    , 'yellow'  , 'none' , 'yellow'  , '#151515')
call NERDTreeHighlightFile('config' , 'yellow'  , 'none' , 'yellow'  , '#151515')
call NERDTreeHighlightFile('conf'   , 'yellow'  , 'none' , 'yellow'  , '#151515')
call NERDTreeHighlightFile('json'   , 'yellow'  , 'none' , 'yellow'  , '#151515')
call NERDTreeHighlightFile('html'   , 'yellow'  , 'none' , 'yellow'  , '#151515')
call NERDTreeHighlightFile('styl'   , 'cyan'    , 'none' , 'cyan'    , '#151515')
call NERDTreeHighlightFile('css'    , 'cyan'    , 'none' , 'cyan'    , '#151515')
call NERDTreeHighlightFile('rb'     , 'Red'     , 'none' , 'red'     , '#151515')
call NERDTreeHighlightFile('js'     , 'Red'     , 'none' , '#ffa500' , '#151515')
call NERDTreeHighlightFile('php'    , 'Magenta' , 'none' , '#ff00ff' , '#151515')
call NERDTreeHighlightFile('vim'    , 'Magenta' , 'none' , '#ff00ff' , '#151515')

let g:NERDTreeDirArrowExpandable  = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeDirArrows           = 1
let NERDTreeWinSize               = 35
let NERDTreeShowHidden            = 1 " 不可視ファイルを表示する
let NERDTreeShowBookmarks         = 1 " bookmarkの表示

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
"Vimのpluginではない,一応外部のものなのでここに記載
"powerline表示用
"====================================================================
"python3 from powerline.vim import setup as powerline_setup
"python3 powerline_setup()
"python3 del powerline_setup

"====================================================================
"switch.vim
"====================================================================
nnoremap <Leader>m  :<C-u>Switch<CR>

"====================================================================
"bronson/vim-trailing-whitespace
"====================================================================
autocmd BufWritePre * :FixWhitespace "ファイル保存時に余分なスペースを削除する

"====================================================================
"vim-tags
"====================================================================
nnoremap ] g<C-]>
nnoremap ]v :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap ]s :split<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap ]G :TagsGenerate<CR>
nmap <F10> :TagbarToggle<CR>
let g:tagbar_width       = 30
let g:tagbar_autoshowtag = 1
"====================================================================
"vim-fzf
"====================================================================
nmap ; :Buffers<CR>
nnoremap \h :History<CR>
nnoremap \c :Commands<CR>
nnoremap \m :Maps<CR>
nnoremap \C :Colors<CR>
"====================================================================
"vim-bufkill
"====================================================================
"バッファを削除
nnoremap sx :BD<cr>:bnext<cr>

"====================================================================
"reireias/vim-cheatsheet
"====================================================================
let g:cheatsheet#cheat_file = '~/.cheatsheet.md'
let g:cheatsheet#vsplit     = 1

"====================================================================
"alvan/vim-closetag
"====================================================================
let g:closetag_filenames = '*.html,*.vue,*.erb,*.php'

"-----------------------Color Scheme--------------------------------
"base16-vim
let base16colorspace=256
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

"====================================================================
"lightline
"====================================================================
let g:lightline = {
      \ 'colorscheme': 'molokai',
      \ 'active': {
      \ 'left': [ [ 'mode', 'paste' ],
      \ [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \ 'fugitive': 'LightLineFugitive',
      \ 'readonly': 'LightLineReadonly',
      \ 'modified': 'LightLineModified',
      \ 'filename': 'LightLineFilename',
      \ 'filetype': 'LightLineFiletype',
      \ 'fileformat': 'LightLineFileformat',
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
