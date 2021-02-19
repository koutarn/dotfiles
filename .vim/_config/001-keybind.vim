"unbind
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap s <Nop>
nnoremap S <Nop>
nnoremap <C-z> <Nop>

"Leader
let mapleader = "\<Space>"
let maplocalleader = ','

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

"Move
nnoremap k gk
nnoremap j gj
nnoremap sh 0
nnoremap sl $
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
inoremap <silent>jj <ESC>
inoremap <C-a> <HOME>
inoremap <C-e> <END>
inoremap <C-l> <DEL>

" 補完表示時のEnterで改行をしない
inoremap <expr><C-n> pumvisible() ? "<Down>" : "<C-j>"
inoremap <expr><C-p> pumvisible() ? "<Up>" : "<C-k>"" " " "


"window
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

"===========================================================
"バッファ
"===========================================================
nnoremap <silent> <Leader>y :bprev<CR>
nnoremap <silent> <Leader>u :bnext<CR>

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

"検索と置換
nnoremap / /\v
" nnoremap sh :<C-u>%s///g<Left><Left><Left>
" vnoremap sh :s///g<Left><Left><Left>
"===========================================================
"alias
"===========================================================
"空のバッファ作成
nnoremap Leaderfn :hide enew<CR>

"読み込み
if has('win32') || has('win64')
  command! Source source ~/_vimrc
elseif has('unix')
  command! Source source ~/.vimrc
endif

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
xnoremap <silent> p :call Put_text_without_override_register()<CR>
