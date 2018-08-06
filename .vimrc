"================================
"汎用
"================================
syntax enable 							"構文ハイライトを有効にする
colorscheme molokai 					"カラースキームの指定
set title								"編集中のファイル名の表示
set showcmd								"入力中のコマンドをステータスに表示する
set number								"行番号を表示
set cursorline							"現在の行を強調表示
set showmatch 							"括弧入力時に対応する括弧を表示
set laststatus=2 						"ステータスラインを常に表示
set wildmode=list:longest 				"コマンドラインの補完
set nohlsearch 							"検索時の協調表示をやめる
set matchpairs& matchpairs+=<:>" 		"対応括弧に<と>のペアを追加
set wildmenu                            "コマンドモードの補完
"================================
"文字、Tab系
"================================
set noexpandtab							"タブ文字をスペースにしない
set tabstop=4							"タブ幅を4文字にする
set autoindent							"自動インデント
set smartindent							"オートインデント
set shiftround 							"インデントをshiftwidthの倍数に丸める
set shiftwidth=4						"自動で挿入されるタブ幅　
set softtabstop=0 						"タブ幅をtabstopの値に任せる
set virtualedit=all  					"文字がない場所にもカーソルを移動できるようにする
set ai 									"自動字下げ
set backspace=indent,eol,start 			"Backspaceキーの影響範囲に制限を設けない
set whichwrap=b,s,h,l,<,>,[,]  			"行頭行末の左右移動で行をまたぐ
set scrolloff=8                			"上下8行の視界を確保
set sidescrolloff=16           			"左右スクロール時の視界を確保
set sidescroll=1               			"左右スクロールは一文字づつ行う
set ambiwidth=double					"全角文字をvimで正しく認識させる設定
set matchtime=1 						"カーソルが飛ぶ時間を変更
set pumheight=10						"補完の幅を10にする
set infercase  							"補完の際の大文字小文字の区別しない
set list								"タブ、空白、改行を可視化
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<,eol:<

"================================
"ファイル処理関連の設定
"================================
 set confirm    						"保存されていないファイルがあるときは終了前に保存確認
 set hidden     						"保存されていないファイルがあるときでも別のファイルを開くことが出来る
 set autoread   						"外部でファイルに変更がされた場合は読みなおす
 set nobackup   						"ファイル保存時にバックアップファイルを作らない
 set noswapfile 						"ファイル編集中にスワップファイルを作らない

"================================
"マウス設定
"================================
set mouse=a
set ttymouse=xterm2

"================================
"キーバインド
"================================
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
nnoremap <Space>h  ^					"先頭行移動
nnoremap <Space>l  $					"行末移動

"複数行をまとめてコメントアウトする
vmap # <c-V>0I#<esc>
vmap C :s/^#//<cr>
vmap // <C-V>0I//<Esc>
vmap c :s/^////<CR>:noh<cr>K

"jキーを二度押しでESCキー
inoremap <silent> jj <Esc><Left>
inoremap <silent> っj <Esc><Left>

" Ctrl + hjkl でウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l"

"カッコとコメントを自動で挿入
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap "" ""<LEFT>
inoremap '' ''<LEFT>
inoremap <> <><LEFT>
inoremap /* /**/<LEFT><LEFT>

"日付入力
inoremap <Leader>date <C-R>=strftime('%Y.%m.%d')<CR>
inoremap <Leader>time <C-R>=strftime('%H:%M')<CR>
inoremap <Leader>w3cd <C-R>=strftime('%Y-%m-%dT%H:%M:%S+09:00')<CR>

"通常の移動と行間移動を切り替え
nnoremap k   gk
nnoremap j   gj
vnoremap k   gk
vnoremap j   gj
nnoremap gk  k
nnoremap gj  j
vnoremap gk  k
vnoremap gj  j

"矢印キーの移動を禁止する。
"map <Up> <Nop>
"map <Down> <Nop>
"map <Left> <Nop>
"map <Right> <Nop>
"inoremap <Up> <Nop>
"inoremap <Down> <Nop>
"inoremap <Left> <Nop>
"inoremap <Right> <Nop>

"保存関係
nnoremap <Space>w  :<C-u>wa<CR>
nnoremap <Space>q  :<C-u>qa<CR>

"置換
nnoremap gs  :<C-u>%s///g<Left><Left><Left>
vnoremap gs  :s///g<Left><Left><Left>

"行を挿入(インサートモードには入らない)
nnoremap <Space>o  :<C-u>for i in range(v:count1) \| call append(line('.'), '') \| endfor<CR>
nnoremap <Space>O  :<C-u>for i in range(v:count1) \| call append(line('.')-1, '') \| endfor<CR>

"タブ操作
nnoremap <C-Tab> gt
nnoremap <C-S-Tab> gT
nnoremap gn :tabnew<CR>

"画面分割
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>



"================================
"スクリプト
"================================

"自動コンプリート"
set completeopt=menuone
for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
 exec "imap " . k . " " . k . "<C-N><C-P>"
endfor
imap <expr> <TAB> pumvisible() ? "\<Down>" : "\<Tab>"

"F5でコンパイル(仮)
function! Run()
    :w
    :!gcc -Wall % -o  %:r
    :!./%:r
endfunction

command! Gcc call Run()
nnoremap<F5> :Gcc<CR><CR>
