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

"map prefix
nnoremap [quickfix] <Nop>
xnoremap [quickfix] <Nop>
nmap <Leader>fq [quickfix]

nnoremap [location] <Nop>
xnoremap [location] <Nop>


"先頭に空白文字があるかどうかで処理を変える。
"thx https://github.com/yuki-yano/zero.vim/tree/main/plugin
noremap <silent><expr> 0 getline('.')[0 : col('.') - 2] =~# '^\s\+$' ? '0' : '^'

"cmd
cnoremap <expr> %h getcmdtype() == ':' ? expand('%:h') . '/' : '%h'

"基本は表示行で移動。ただしカウントで飛びたい場合は論理行で移動する。
"thx monaqa
nnoremap <expr> j v:count == 0 ? 'gj' : 'j'
xnoremap <expr> j (v:count == 0 && mode() ==# 'v' && mode() ==# 'V' && mode() ==# 'CTRL-V') ? 'gj' : 'j'
nnoremap <expr> k v:count == 0 ? 'gk' : 'k'
xnoremap <expr> k (v:count == 0 && mode() ==# 'v' && mode() ==# 'V' && mode() ==# 'CTRL-V') ? 'gk' : 'k'

"input
nnoremap <silent><Leader>o  <Cmd>for i in range(v:count1) \| call append(line('.'), '') \| endfor<CR>
nnoremap <silent><Leader>O  <Cmd>for i in range(v:count1) \| call append(line('.')-1, '') \| endfor<CR>

"設定の再読み込み
nnoremap <silent><Leader>fr :Source<CR>

"vimrcの編集
nnoremap <silent><Leader>f, :EditVim<CR>

"QuickFix
nnoremap [quickfix]h <Cmd>cprevious<CR>
nnoremap [quickfix]l <Cmd>cnext<CR>
nnoremap [quickfix]q <Cmd>copen<CR>

"location list
nmap <Leader>fl [location]
nnoremap [location]h <Cmd>lprevious<CR>
nnoremap [location]l <Cmd>lnext<CR>

" Undoポイントの設置
" thx https://zenn.dev/kato_k/articles/vim-tips-no006
inoremap <silent><C-w> <C-g>u<C-w>
inoremap <silent><C-u> <C-g>u<C-u>
inoremap <silent><C-m> <C-g>u<C-m>

" タグ先複数選択を常に
" thx tsuyoshicho
" https://github.com/tsuyoshicho/vimrc-reading/blob/7451171f07e88d6d1dcd73deb792aff115d2c94e/.vimrc#L597-L598
nnoremap <C-]> g<C-]>

"検索
nnoremap / /\v

"clipboard paste
inoremap <C-v> <C-r><C-p>+
cnoremap <C-v> <C-r>+

"cmd window用
augroup vimrc_cmdwindow
    autocmd!
    autocmd CmdwinEnter * nnoremap <buffer><silent>q <Cmd>:close<CR>
augroup END

"terminal
tnoremap jj <C-\><C-n>

augroup vimrc
  autocmd TermOpen * call s:terminal_init()
  autocmd TermOpen * setlocal wrap
  autocmd TermOpen * setlocal nonumber
  autocmd TermOpen * setlocal signcolumn=no
  autocmd TermOpen * setlocal foldcolumn=0
augroup END

function! s:terminal_init()
  nnoremap <buffer> <CR> i<CR><C-\><C-n>
  nnoremap <expr><buffer> u "i" . repeat("<Up>", v:count1) . "<C-\><C-n>"
  nnoremap <expr><buffer> <C-r> "i" . repeat("<Down>", v:count1) . "<C-\><C-n>"
  nnoremap <buffer> dd i<C-u><C-\><C-n>
  nnoremap <buffer> A i<C-e>
  nnoremap <buffer> p pi
endfunction

"vモードの置換連続ペースト用
function! Put_text_without_override_register()
    let is_line_end = virtcol("'>") == virtcol("$") - 1
    execute 'normal! "_x'
    if is_line_end
        execute 'normal! p'
    else
        execute 'normal! P'
    endif
endfunction

xnoremap <silent> p <Cmd>call Put_text_without_override_register()<CR>
