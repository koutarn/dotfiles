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

"仮想置換モード
nnoremap gR <Nop>

"多分今後も選択モードは使用しない
vnoremap <C-g> <Nop>

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

"ノーマルモードに戻す
inoremap jj <ESC>
onoremap jj <Esc>
cnoremap jj <C-c>

"Buffer
nnoremap <Leader>y <Cmd>bprevious<CR>
nnoremap <Leader>u <Cmd>bnext<CR>

"設定の再読み込み
nnoremap <silent><Leader>fr :Source<CR>

"vimrcの編集
nnoremap <silent><Leader>f, :EditVim<CR>

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
inoremap <C-k> <UP>
inoremap <C-j> <DOWN>

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

"clipboard paste
inoremap <C-v> <C-r><C-p>+
cnoremap <C-v> <C-r>+

"digraphs
"thx https://qiita.com/monaqa/items/dcd43a53d3040293142a
noremap fj f<C-k>j
noremap Fj F<C-k>j
noremap tj t<C-k>j
noremap Tj T<C-k>j

"register digraph
"thx https://github.com/monaqa/dotfiles/blob/9861ff9b516786f5c3f6f6595eba2a9dab73c084/.config/nvim/scripts/keymap.vim#L192
function s:register_digraph(key_pair,char)
    execute('digraphs ' .. a:key_pair .. ' ' .. char2nr(a:char))
endfunction

call s:register_digraph('j(','（')
call s:register_digraph('j)','）')
call s:register_digraph('j[','「')
call s:register_digraph('j]','」')
call s:register_digraph('j<','【')
call s:register_digraph('j>','】')

" 句読点
call s:register_digraph('j,','、')
call s:register_digraph('j.','。')
call s:register_digraph('j!','！')
call s:register_digraph('j?','？')
call s:register_digraph('j:','：')

" 数字
call s:register_digraph('j0','０')
call s:register_digraph('j1','１')
call s:register_digraph('j2','２')
call s:register_digraph('j3','３')
call s:register_digraph('j4','４')
call s:register_digraph('j5','５')
call s:register_digraph('j6','６')
call s:register_digraph('j7','７')
call s:register_digraph('j8','８')
call s:register_digraph('j9','９')

" その他の記号
call s:register_digraph('j~','〜')
call s:register_digraph('j/','・')

"jにもいけるように
call s:register_digraph('jj','j')

"てにおは
call s:register_digraph('jt','て')
call s:register_digraph('ji','に')
call s:register_digraph('jw','を')
call s:register_digraph('jh','は')
call s:register_digraph('jg','が')
call s:register_digraph('jd','で')
call s:register_digraph('jo','と')
call s:register_digraph('jn','の')
call s:register_digraph('jk','か')

"cmd window用
augroup vimrc_cmdwindow
    autocmd!
    autocmd CmdwinEnter * nnoremap <buffer><silent>q <Cmd>:close<CR>
augroup END

"help確認用
nnoremap <Leader>fhn <Cmd>h normal-index<CR>
nnoremap <Leader>fhi <Cmd>h insert-index<CR>
nnoremap <Leader>fhv <Cmd>h visual-index<CR>
nnoremap <Leader>fhce <Cmd>h ex-edit-index<CR>
nnoremap <Leader>fhcc <Cmd>h ex-cmd-index<CR>
nnoremap <Leader>fht <Cmd>h terminal-job-index<CR>
nnoremap <Leader>fho <Cmd>h option-list<CR>
nnoremap <Leader>fhf <Cmd>h function-list<CR>
nnoremap <Leader>fhT <Cmd>h help-tags<CR>
nnoremap <Leader>fhV <Cmd>h vim-variable<CR>
nnoremap <Leader>fhI <Cmd>h index<CR>


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
