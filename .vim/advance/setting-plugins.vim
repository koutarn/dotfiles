"====================================================================
"molokai.vim
"====================================================================
colorscheme molokai
let g:molokai_original = 1

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
"" 不可視ファイルを表示する
let nerdtreeshowhidden = 1
map <c-e> :nerdtreetabstoggle<cr>

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

"====================================================================
"mattn/sonictemplate-vim
"====================================================================
let g:sonictemplate_vim_template_dir = ['~/.vim/Template']

"====================================================================
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
set laststatus=2
set showtabline=2
set t_Co=256
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

"====================================================================
"vim-fzf
"====================================================================
nmap ; :Buffers<CR>
nmap t :Files<CR>

"====================================================================
"vim-bufkill
"====================================================================
nnoremap sx :BD<cr>:bnext<cr>     "バッファを削除して次へ
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
