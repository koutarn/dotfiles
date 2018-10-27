"素の状態のkeybindを記載
"plugin毎のkeybindは、.vim/advance/setting-plugins.vimに書いてる
"===========================================================
"settings
"===========================================================
nnoremap s <Nop>
nnoremap S <Nop>
nnoremap <C-z> <Nop>
let mapleader = "\<Space>"				"Leaderをspaceに変更
"===========================================================
"移動
"===========================================================
nnoremap k   gk
nnoremap j   gj
vnoremap k   gk
vnoremap j   gj
nnoremap gk  k
nnoremap gj  j
vnoremap gk  k
vnoremap gj  j
nnoremap sh ^		  "先頭行移動
nnoremap sl $		  "行末移動
vnoremap v $h 		  "vを二回で行末まで選択

" Ctrl + hjkl でウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l"
"===========================================================
"入力
"===========================================================
nnoremap <Leader>o  :<C-u>for i in range(v:count1) \| call append(line('.'), '') \| endfor<CR>
nnoremap <Leader>O  :<C-u>for i in range(v:count1) \| call append(line('.')-1, '') \| endfor<CR>

vmap # <c-V>0I#<Esc>                         "visual modeで一気にコメントにする
vmap " <c-V>0I"<Esc>                         "visual modeで一気にコメントにする
vmap // <C-V>0I//<Esc>                       "visual modeで一気にコメントにする
nnoremap == gg=G  			                     "=を二回連続入力でバッファ全体をインデント整理
nnoremap sg  :<C-u>%s///g<Left><Left><Left>  "置換
vnoremap sg  :s///g<Left><Left><Left>        "置換

"spaceを折りたたみに利用
nnoremap <space> za
vnoremap <space> zf

"二度押しでコマンドモードへ
inoremap <silent> jj <Esc>:echo "canceled input mode"<CR>
inoremap <silent> っj <esc>:echo "canceled input mode"<CR>
vnoremap <silent>ff <ESC>:echo "canceled visual mode"<CR>
vnoremap <silent>っｆ <Esc>:echo "canceled visual mode"<CR>
nnoremap <leader>w  :<c-u>wa<cr>   "保存
nnoremap <leader>q  :<c-u>qa<cr>   "閉じる
nnoremap bo  :%!xxd<cr>            "バイナリで開く

"タブ操作
nnoremap su gt                "タブを移動
nnoremap sy gT                "タブを移動
nnoremap sn :tabnew<CR>       "タブを開く
nnoremap sx :<c-u>q<CR>       "タブを閉じる

"画面分割
nnoremap <C-s>s :<C-u>sp<CR>
nnoremap <C-s>v :<C-u>vs<CR>

"検索結果を画面中央に
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz

"選択中のインデント整形をずっと選択していることに変更する
nnoremap <Tab> v>
nnoremap <S-Tab> v<
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
vnoremap > >gv
vnoremap < <gv

"日付入力
inoremap <Leader>date <C-R>=strftime('%Y.%m.%d')<CR>

"safety lock japanese IME
nnoremap あ a
nnoremap い i
nnoremap う u
nnoremap え e
nnoremap お o
nnoremap っd dd
nnoremap っy yy
nnoremap し” ci"
nnoremap し’ ci'
nnoremap せ ce
nnoremap で de
inoremap <silent> っｊ <ESC>
nnoremap っz zz
nnoremap ・ /
