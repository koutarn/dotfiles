"モード	再割当無し	再割当有り
"ノーマルモード＋ビジュアルモード	noremap	map
"コマンドラインモード＋インサートモード	noremap!	map!
"ノーマルモード	nnoremapnmap
"ビジュアル(選択)モード	vnoremapvmap
"コマンドラインモード	cnoremap	cmap
"インサート(挿入)モード	inoremapimap))  

let mapleader = "\<Space>"				"Leaderをspaceに変更
nnoremap == gg=G  						"=を二回連続入力でバッファ全体をインデント整理
vnoremap v $h 							"vを二回で行末まで選択
nnoremap <Leader>h  ^					"先頭行移動
nnoremap <Leader>l  $					"行末移動

"複数行をまとめてコメントアウトする
vmap # <c-V>0I#<esc>
vmap C :s/^#//<cr>
vmap // <C-V>0I//<Esc>
vmap c :s/^////<CR>:noh<cr>K

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
"inoremap <Leader>date <C-R>=strftime('%Y.%m.%d')<CR>
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

"保存関係
nnoremap <Leader>w  :<C-u>wa<CR>
nnoremap <Leader>q  :<C-u>qa<CR>

"バイナリで開く
nnoremap bo  :%!xxd<CR> 				

"置換
nnoremap gs  :<C-u>%s///g<Left><Left><Left>
vnoremap gs  :s///g<Left><Left><Left>

"行を挿入(インサートモードには入らない)
nnoremap <Leader>o  :<C-u>for i in range(v:count1) \| call append(line('.'), '') \| endfor<CR>
nnoremap <Leader>O  :<C-u>for i in range(v:count1) \| call append(line('.')-1, '') \| endfor<CR>

"タブ操作
nnoremap <Leader>y gt
nnoremap tg gT
nnoremap gn :tabnew<CR>

"画面分割
nnoremap s <Nop>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
