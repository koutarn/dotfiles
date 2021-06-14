" map早見表 by vim.jp slack
" +--------------------------------------------------------------------------------------+
" | Commands \ Modes | Normal | Insert | Command | Visual | Select | Operator | Terminal |
" |------------------|--------|--------|---------|--------|--------|----------|----------|
" | map  / noremap   |    @   |   -    |    -    |   @    |   @    |    @     |    -     |
" | nmap / nnoremap  |    @   |   -    |    -    |   -    |   -    |    -     |    -     |
" | vmap / vnoremap  |    -   |   -    |    -    |   @    |   @    |    -     |    -     |
" | omap / onoremap  |    -   |   -    |    -    |   -    |   -    |    @     |    -     |
" | xmap / xnoremap  |    -   |   -    |    -    |   @    |   -    |    -     |    -     |
" | smap / snoremap  |    -   |   -    |    -    |   -    |   @    |    -     |    -     |
" | map! / noremap!  |    -   |   @    |    @    |   -    |   -    |    -     |    -     |
" | imap / inoremap  |    -   |   @    |    -    |   -    |   -    |    -     |    -     |
" | lmap / lnoremap  |    -   |   @    |    @    |   -    |   -    |    -     |    -     | (Lang-Arg)
" | cmap / cnoremap  |    -   |   -    |    @    |   -    |   -    |    -     |    -     |
" | tmap / tnoremap  |    -   |   -    |    -    |   -    |   -    |    -     |    @     |
" +--------------------------------------------------------------------------------------+

"Leader
let g:mapleader = "\<Space>"
let g:maplocalleader = ","

"unbind
nnoremap Q <Nop>
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap s <Nop>
nnoremap S <Nop>
nnoremap <C-z> <Nop>

"保持しない
nnoremap x "_x
vnoremap x "_x
nnoremap X "_X
vnoremap X "_X

"cmd
cnoremap <C-e> <End>
cnoremap <C-a> <Home>
cnoremap <C-h> <LEFT>
cnoremap <C-k> <UP>
cnoremap <C-j> <DOWN>
cnoremap <C-l> <RIGHT>
cnoremap <C-p> <C-r>0

"インデントに合せてペースト
nnoremap p ]p
nnoremap ]p p

"USキーボード用に入れ替える。
nnoremap : ;
nnoremap ; :
vnoremap : ;
vnoremap ; :

"Move
nnoremap k gk
nnoremap j gj
vnoremap k gk
vnoremap j gj
nnoremap gk k
nnoremap gj j
vnoremap gk k
vnoremap gj j
vnoremap v $h
nnoremap <S-k> 10gk
nnoremap <S-j> 10gj
vnoremap <S-k> 10gk
vnoremap <S-j> 10gj

"input
nnoremap <silent><Leader>o  <Cmd>for i in range(v:count1) \| call append(line('.'), '') \| endfor<CR>
nnoremap <silent><Leader>O  <Cmd>for i in range(v:count1) \| call append(line('.')-1, '') \| endfor<CR>

inoremap jj <ESC>
onoremap jj <Esc>
cnoremap jj <C-c>

"Buffer
nnoremap <Leader>y <Cmd>bprevious<CR>
nnoremap <Leader>u <Cmd>bnext<CR>

"設定の再読み込み
nnoremap <silent><Leader>fr :Source<CR>

"QuickFix
nnoremap <Leader>fqh <Cmd>cprevious<CR>
nnoremap <Leader>fql <Cmd>cnext<CR>
nnoremap <Leader>fqq <Cmd>copen<CR>

"location list
nnoremap <Leader>flh <Cmd>lprevious<CR>
nnoremap <Leader>fll <Cmd>lnext<CR>

"window
nnoremap <Leader>- <Cmd>split<CR>
nnoremap <Leader>\ <Cmd>vsplit<CR>
nnoremap <Leader>x <Cmd>close<CR>

"ウィンドウ間を移動
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k  <C-w>k
nnoremap <Leader>l <C-w>l

" Undoポイントの設置
" thx https://zenn.dev/kato_k/articles/vim-tips-no006
inoremap <silent><C-w> <C-g>u<C-w>
inoremap <silent><C-u> <C-g>u<C-u>
inoremap <silent><C-m> <C-g>u<C-m>

inoremap <C-a> <HOME>
inoremap <C-e> <END>
inoremap <C-o> <DEL>
inoremap <C-h> <LEFT>
inoremap <C-l> <RIGHT>
inoremap <C-j> <Down>
inoremap <C-k> <Up>

" タグ先複数選択を常に
" thx tsuyoshicho
" https://github.com/tsuyoshicho/vimrc-reading/blob/7451171f07e88d6d1dcd73deb792aff115d2c94e/.vimrc#L597-L598
nnoremap <C-]> g<C-]>

"インデント整形
vnoremap > >gv
vnoremap < <gv
nnoremap == gg=G

"検索
nnoremap / /\v


"digraphs
"thx https://qiita.com/monaqa/items/dcd43a53d3040293142a
noremap fj f<C-k>j
noremap Fj F<C-k>j
noremap tj t<C-k>j
noremap Tj T<C-k>j
digraphs j( 65288  " （
digraphs j) 65289  " ）
digraphs j[ 12300  " 「
digraphs j] 12301  " 」
digraphs j{ 12302  " 『
digraphs j} 12303  " 』
digraphs j< 12304  " 【
digraphs j> 12305  " 】

" 句読点
digraphs j, 12289  " 、
digraphs j. 12290  " 。
digraphs j! 65281  " ！
digraphs j? 65311  " ？
digraphs j: 65306  " ：

" 数字
digraphs j0 65296  " ０
digraphs j1 65297  " １
digraphs j2 65298  " ２
digraphs j3 65299  " ３
digraphs j4 65300  " ４
digraphs j5 65301  " ５
digraphs j6 65302  " ６
digraphs j7 65303  " ７
digraphs j8 65304  " ８
digraphs j9 65305  " ９

" その他の記号
digraphs j~ 12316  " 〜
digraphs j/ 12539  " ・
digraphs js 12288  " 　

"jにもいけるように
digraphs jj 106  " j

"vモードの置換連続ペースト用
function! Put_text_without_override_register()
  let line_len = strlen(getline('.'))
  execute "normal! `>"
  let col_loc = col('.')
  execute 'normal! gv"_x'
  if line_len == col_loc
    execute 'normal! p'
  else
    execute 'normal! P'
  endif
endfunction
xnoremap <silent> p <Cmd>call Put_text_without_override_register()<CR>
