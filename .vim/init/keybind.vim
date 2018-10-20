"keybind
"素の状態のkeybindを記載
"plugin毎のkeybindは、.vim/plugins/各プラグイン名に書いてる 2018.10.14

"ノーマルモード＋ビジュアルモード           noremap      map
"コマンドラインモード＋インサートモード     noremap!     map!
"ノーマルモード                             nnoremap     nmap
"インサート(挿入)モード                     inoremap     imap))
"ビジュアル(選択)モード                     vnoremap     vmap
"コマンドラインモード                       cnoremap     cmap

let mapleader = "\<Space>"				"Leaderをspaceに変更
nnoremap == gg=G  						"=を二回連続入力でバッファ全体をインデント整理
vnoremap v $h 							"vを二回で行末まで選択
nnoremap <Leader>h ^					"先頭行移動
nnoremap <Leader>l $					"行末移動

"複数行をまとめてコメントアウトする
vmap # <c-V>0I#<Esc>
vmap " <c-V>0I"<Esc>
vmap // <C-V>0I//<Esc>

"jキーを二度押しでESCキー
inoremap <silent> jj <Esc><Left>
inoremap <silent> っj <Esc><Left>

"カッコとコメントを自動で挿入
"pluginを入れたのでコメントにした
"inoremap { {}<LEFT>
"inoremap [ []<LEFT>
"inoremap ( ()<LEFT>
"inoremap "" ""<LEFT>
"inoremap '' ''<LEFT>
"inoremap <> <><LEFT>
"inoremap /* /**/<LEFT><LEFT>

"日付入力
inoremap <Leader>date <C-R>=strftime('%Y.%m.%d')<CR>
"inoremap <Leader>time <C-R>=strftime('%H:%M')<CR>
"inoremap <Leader>w3cd <C-R>=strftime('%Y-%m-%dT%H:%M:%S+09:00')<CR>

"通常の移動と行間移動を切り替え
nnoremap k   gk
nnoremap j   gj
vnoremap k   gk
vnoremap j   gj
nnoremap gk  k
nnoremap gj  j
vnoremap gk  k
vnoremap gj  j

" Ctrl + hjkl でウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l"


nnoremap <Leader>w  :<C-u>wa<CR>   "保存
nnoremap <Leader>q  :<C-u>qa<CR>   "閉じる
nnoremap bo  :%!xxd<CR>            "バイナリで開く

"置換
nnoremap sg  :<C-u>%s///g<Left><Left><Left>
vnoremap sg  :s///g<Left><Left><Left>

"行を挿入(インサートモードには入らない)
nnoremap <Leader>o  :<C-u>for i in range(v:count1) \| call append(line('.'), '') \| endfor<CR>
nnoremap <Leader>O  :<C-u>for i in range(v:count1) \| call append(line('.')-1, '') \| endfor<CR>

"タブ操作
nnoremap <C-u> gt
nnoremap <C-y> gT
nnoremap gn :tabnew<CR>

"ファイルを閉じる
nnoremap <C-x> :<C-u>q<CR>

"画面分割
nnoremap s <Nop>

nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
