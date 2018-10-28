"====================================================================
"Vim Plug auto load
"====================================================================
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

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

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeDirArrows = 1
let NERDTreeWinSize=35

" 不可視ファイルを表示する
let NERDTreeShowHidden=1
"====================================================================
"ryanoasis/vim-devicons
"====================================================================
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

"===================================================================
"edgemotion.vim
"====================================================================
map sj <Plug>(edgemotion-j)
map sk <Plug>(edgemotion-k)

"====================================================================
"Yggdroot/indentLine
"====================================================================
let g:indentline_enabled = 1                    "indentLineを有効にする
let g:indentline_setcolors = 1                  "indentlineを強調表示
let g:indentline_color_term = 222               "indentlineの色を変更
let g:indentline_char = '|'                     "indentlineの文字を変更

"====================================================================
"Xuyuanp/nerdtree-git-plugin
"====================================================================
"let g:NERDTreeIndicatorMapCustom = {
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
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

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
"====================================================================
"vim-fzf
"====================================================================
nmap ; :Buffers<CR>
nmap t :Files<CR>
"====================================================================
"vim-bufkill
"====================================================================
"バッファを削除
nnoremap sx :BD<cr>:bnext<cr>
"====================================================================
"散文モード
"====================================================================
function! ProseMode()
  "LimeLight で暗い場所の文字色を指定
  let g:limelight_conceal_ctermfg = 'DarkGray'
  colorscheme seoul256
  Goyo 60%x60%
  Limelight
  NERDTreeClose
endfunction

command! ProseMode call ProseMode()
nmap \p :ProseMode

"reireias/vim-cheatsheet
let g:cheatsheet#cheat_file = '~/.cheatsheet.md'
let g:cheatsheet#vsplit = 1

"alvan/vim-closetag
let g:closetag_filenames = '*.html,*.vue,*.erb,*.php'

"-----------------------Color Scheme--------------------------------
"====================================================================
"monokai.vim
"====================================================================
"colorscheme monokai
"====================================================================
"molokai.vim
"====================================================================
colorscheme molokai
let g:molokai_original = 1
"====================================================================
"altercation/vim-colors-solarized
"====================================================================
"set background=dark
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1
"colorscheme solarized
"====================================================================
"tyrannicaltoucan/vim-quantum
"====================================================================
"set background=dark
"set termguicolors
"colorscheme quantum

"====================================================================
"w0ng/vim-hybrid
"====================================================================
"set background=dark
"colorscheme hybrid
"
"====================================================================
"lightline
"====================================================================
let g:lightline = {
      \ 'colorscheme': 'molokai',
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
