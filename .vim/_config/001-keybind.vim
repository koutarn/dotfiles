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

"unbind
nnoremap Q <Nop>
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap s <Nop>
nnoremap S <Nop>
nnoremap <C-z> <Nop>

"Leader
let g:mapleader = "\<Space>"
let g:maplocalleader = ","

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
nnoremap <silent><Leader>o  :<C-u>for i in range(v:count1) \| call append(line('.'), '') \| endfor<CR>
nnoremap <silent><Leader>O  :<C-u>for i in range(v:count1) \| call append(line('.')-1, '') \| endfor<CR>

inoremap jj <ESC>
onoremap jj <Esc>
cnoremap jj <C-c>

"QuickFix
nnoremap <leader>fqh :<C-u>cprevious<CR>
nnoremap <leader>fql :<C-u>cnext<CR>
nnoremap <leader>fqq :<C-u>copen<CR>

"Buffer
nnoremap <leader>fbh :<C-u>bprevious<CR>
nnoremap <leader>fbl :<C-u>bnext<CR>

"location list
nnoremap <leader>flh :<C-u>lprevious<CR>
nnoremap <leader>fll :<C-u>lnext<CR>


"window
nnoremap <Leader>- :<C-u>split<CR>
nnoremap <Leader>\ :<C-u>vsplit<CR>
nnoremap <Leader>x :<C-u>close<CR>

"ウィンドウ間を移動
nnoremap <Leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k  <C-w>k
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
xnoremap <silent> p :<C-u>call Put_text_without_override_register()<CR>
