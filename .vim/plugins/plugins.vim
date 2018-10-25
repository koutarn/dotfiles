"scrooloose/nerdtree
"
"" 不可視ファイルを表示する
let NERDTreeShowHidden = 1
map <C-e> :NERDTreeTabsToggle<CR>

"NERDtreeを自動で有効にする
"let g:nerdtree_tabs_open_on_console_startup = 1
"
"" NERDTress File highlighting
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

"mattn/sonictemplate-vim
let g:sonictemplate_vim_template_dir = ['~/.vim/Template']

"edgemotion.vim
map <Leader>j <Plug>(edgemotion-j)
map <Leader>k <Plug>(edgemotion-k)

"Yggdroot/indentLine
let g:indentline_enabled = 1                    "indentLineを有効にする
let g:indentline_setcolors = 0                  "indentlineを強調表示
let g:indentline_color_term = 222               "indentlineの色を変更
let g:indentline_char = '|'                     "indentlineの文字を変更

"molokai.vim
let g:molokai_original = 1

"Xuyuanp/nerdtree-git-plugin
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

"Vimのpluginではない,一応外部のものなのでここに記載
"powerline表示用
set laststatus=2
set showtabline=2
set t_Co=256
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

"switch.vim
nnoremap <Leader>m  :<C-u>Switch<CR>

"bronson/vim-trailing-whitespace
"ファイル保存時に余分なスペースを削除する
autocmd BufWritePre * :FixWhitespace

"複数の候補から選べるようにする
nnoremap <F10> g<C-]>
nnoremap v<F10> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap s<F10> :split<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <Leader>t :Tags<CR>
nnoremap <Leader>G :TagsGenerate<CR>
