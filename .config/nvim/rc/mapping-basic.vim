"=============================================
" ideavimrcと共通のマッピングをここに定義する
"=============================================

"unbind
nnoremap Q <Nop>
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap s <Nop>
nnoremap S <Nop>
nnoremap <C-z> <Nop>
nnoremap gR <Nop>
vnoremap <C-g> <Nop>

"Leader
let g:mapleader = "\<Space>"
let g:maplocalleader = ","

"保持しない
nnoremap x "_x
vnoremap x "_x
nnoremap X "_X
vnoremap X "_X

"Emacs風バインド
cnoremap <C-e> <End>
cnoremap <C-a> <Home>
cnoremap <C-h> <LEFT>
cnoremap <C-k> <UP>
cnoremap <C-j> <DOWN>
cnoremap <C-l> <RIGHT>
inoremap <C-a> <HOME>
inoremap <C-e> <END>
inoremap <C-k> <UP>
inoremap <C-j> <DOWN>

"インデントに合せてペースト
nnoremap p ]p
nnoremap ]p p
nnoremap P ]P
nnoremap ]P P

"USキーボード用に入れ替える。
nnoremap : ;
nnoremap ; :
vnoremap : ;
vnoremap ; :

vnoremap v $h
nnoremap <S-k> 10gk
nnoremap <S-j> 10gj
vnoremap <S-k> 10gk
vnoremap <S-j> 10gj

"ノーマルモードに戻す
inoremap jj <ESC>
onoremap jj <Esc>
cnoremap jj <C-c>

"Buffer
nnoremap <Leader>y :<C-u>bprevious<CR>
nnoremap <Leader>u :<C-u>bnext<CR>

"window
nnoremap <Leader>- :<C-u>split<CR>
nnoremap <Leader>\ :<C-u>vsplit<CR>
nnoremap <Leader>x :<C-u>close<CR>

"ウィンドウ間を移動
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k  <C-w>k
nnoremap <Leader>l <C-w>l

"インデント整形
vnoremap > >gv
vnoremap < <gv
nnoremap == gg=G
