"=============================================================
"素の状態のkeybindを記載
"plugin毎のkeybindはadvance/bind-plugins.vimに書いてる
"=============================================================
"settings

"unbind
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap q <Nop>
nnoremap qq <Nop>
nnoremap s <Nop>
nnoremap S <Nop>
nnoremap <C-z> <Nop>
let mapleader = "\<Space>"    "Leaderをspaceに変更
let maplocalleader = ';'
"xで削除してもヤンクされないようにする
nnoremap x "_x
vnoremap x "_x
nnoremap X "_X
vnoremap X "_X

"コマンドライン
cnoremap <C-e> <End>
cnoremap <C-a> <Home>

cnoremap <C-h> <LEFT>
cnoremap <C-k> <UP>
cnoremap <C-j> <DOWN>
cnoremap <C-l> <RIGHT>
cnoremap <C-p> <C-r>0
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
nnoremap sh ^
nnoremap sl $
vnoremap v $h

nnoremap <S-k> 10gk
nnoremap <S-j> 10gj
vnoremap <S-k> 10gk
vnoremap <S-j> 10gj

"===========================================================
"入力
"===========================================================
inoremap /* /*  */<Left><Left><Left>
"nnoremap / /\v
"vnoremap / /\v
"nnoremap <ESC><ESC> :noh<CR>
nnoremap <silent><Leader>o  :<C-u>for i in range(v:count1) \| call append(line('.'), '') \| endfor<CR>
nnoremap <silent><Leader>O  :<C-u>for i in range(v:count1) \| call append(line('.')-1, '') \| endfor<CR>
vmap # <c-V>0I#<Esc>
vmap " <c-V>0I"<Esc>
vmap // <C-V>0I//<Esc>
nnoremap sg  :<C-u>%s///g<Left><Left><Left>
vnoremap sg  :s///g<Left><Left><Left>
nnoremap Y y$

"二度押しでコマンドモードへ
inoremap <silent> jj <Esc>
"nnoremap bo  :%!xxd<cr>
inoremap <silent> っj <ESc>
vnoremap <silent>ff <ESC>
vnoremap <silent>っｆ <Esc>

"インクリメント
nnoremap <Down> <C-x>
nnoremap <Up> <C-a>

""行を移動
"nnoremap <C-j> "zdd"zp
"nnoremap <C-k> "zdd<Up>"zP
"
""複数行を移動
"vnoremap <C-j> "zx"zp`[V`]
"vnoremap <C-k> "zx<Up>"zP`[V`]

"insert mode
"インサートモードでもhjklで移動
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-h> <Left>
"imap <C-l> <Right>
imap <C-a> <HOME>
imap <C-e> <END>
"===========================================================
"text object ty skanehira
"===========================================================
"https://github.com/skanehira/dotfiles/blob/master/vim/vimrc

"change
nmap ci8 ci(
nmap ci2 ci"
nmap ci7 ci'
nmap ci, ci<

nmap ca8 ca(
nmap ca2 ca"
nmap ca7 ca'
nmap ca, ca<

"delete
nmap di8 di(
nmap di2 di"
nmap di7 di'
nmap di, di<

nmap da8 da(
nmap da2 da"
nmap da7 da'
nmap da, da<

"yank
nmap yi8 yi(
nmap yi2 yi"
nmap yi7 yi'
nmap yi, yi<

nmap ya8 ya(
nmap ya2 ya"
nmap ya7 ya'
nmap ya, ya<

"前方後方削除
nnoremap dl d$
nnoremap dh d0

"===========================================================
"ウィンドウ
"===========================================================
nnoremap <Leader>s :<C-u>sp<CR>
nnoremap <Leader>v :<C-u>vs<CR>
nnoremap <Leader>x :q<CR>
nnoremap <leader>w  :<c-u>wa<cr>
nnoremap <leader>q  :<c-u>qa<cr>

"ウィンドウ間を移動
nnoremap <Leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k  <C-w>k
nnoremap <Leader>l <C-w>l

"タブ廃止(バッファで代用する)
"nnoremap <Leader>n :tabnew<CR>
"nnoremap <Leader>d :tabc<CR>
"nnoremap <Leader>u gt
"nnoremap <Leader>y gT

"===========================================================
"バッファ
"===========================================================
nnoremap <silent> sy :bprev<CR>
nnoremap <silent> su :bnext<CR>

"===========================================================
"その他
"===========================================================
"検索結果を画面中央に
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz

"インデント整形
vnoremap > >gv
vnoremap < <gv
nnoremap == gg=G

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

"spaceを二度押しで単語を光らせる
"nnoremap <silent> <Space><Space> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>"

"移動を楽にする。
nnoremap <CR> G
nnoremap <BS> gg

"windows用の設定
if has('win32') || has('win64')
  nnoremap <F12> :set fenc=cp932<CR>
endif

"===========================================================
"alias
"===========================================================
"Todo
command! Todo edit ~\Desktop\Memo\TODO.txt

"cheetsheet
command! Cheet edit ~/Desktop/Memo/CheetSheet.txt

"空のバッファ作成
nnoremap <Leader>b :hide enew<CR>

"一時ファイル
command! -nargs=1 -complete=filetype Tmp edit ~/Desktop/Memo/tmp.<args>
command! -nargs=1 -complete=filetype Temp edit ~/Desktop/Memo/tmp.<args>

"読み込み
if has('win32') || has('win64')
  command! Source source ~/_vimrc
elseif has('unix')
  	command! Source source ~/.vimrc
endif

"日付入力
inoremap <expr> _day strftime('%Y-%m-%d')
