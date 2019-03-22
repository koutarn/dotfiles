"====================================================================
"vim-scripts/wimproved.vim
"====================================================================
map <F1> :WToggleFullscreen<CR>:WCenter 80<CR>

"====================================================================
"'thinca/vim-fontzoom'
"====================================================================
map <F2> :Fontzoom 10<CR>
map <F3> :Fontzoom 11<CR>

"====================================================================
"scrooloose/nerdtree
"====================================================================
map <F4> :NERDTreeToggle<CR>
silent! map <C-h> :NERDTreeFind<CR>

"====================================================================
"Ctags Create
"====================================================================
map <F5> :!ctags -R .<CR>

"====================================================================
"'godlygeek/tabular'
"====================================================================
vmap <Leader><Leader> :Tabularize /

"====================================================================
"Lokaltog/vim-easymotion
"====================================================================
map f <Plug>(easymotion-bd-w)
map sj <Plug>(easymotion-j)
map sk <Plug>(easymotion-k)

"====================================================================
"'osyo-manga/vim-over'
"====================================================================
"nnoremap <silent>sg :OverCommandLine<CR>%s//<Left>

"====================================================================
"vim-fzf
"====================================================================
" nmap ; :Buffers<CR>
" nmap t :Tags<CR>
" nmap q :Files<CR>
" nnoremap \h :History<CR>
" nnoremap \c :Commands<CR>
" nnoremap \m :Maps<CR>
" nnoremap \C :Colors<CR>
"====================================================================
"switch.vim
"====================================================================
nnoremap <Leader>m  :<C-u>Switch<CR>

"====================================================================
"bronson/vim-trailing-whitespace
"====================================================================
nmap <F9> <Plug>window:quickfix:toggle

"====================================================================
"vim-tags
"====================================================================
nnoremap ] g<C-]>
nnoremap <C-]> <C-t>
nnoremap ]v :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap ]s :split<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap ]G :TagsGenerate<CR>
nmap <F10> :TagbarToggle<CR>

"====================================================================
"vim-bufkill
"====================================================================
"バッファを削除
nnoremap sx :BD<cr>:bnext<cr>

"====================================================================
"yankround.vim
"====================================================================
"nmap p <Plug>(yankround-p)
"nmap P <Plug>(yankround-P)
"nmap gp <Plug>(yankround-gp)
"nmap gP <Plug>(yankround-gP)
"nmap <S-p> <Plug>(yankround-prev)
"nmap <S-n> <Plug>(yankround-next)

"====================================================================
"haishanh/night-owl.vim
"====================================================================
command! NightOwl colorscheme night-owl

"====================================================================
"'jdkanani/vim-material-theme'
"====================================================================
command! Material colorscheme material-theme

"====================================================================
"t9md/vim-quickhl
"====================================================================
nmap <Space><Space> <Plug>(quickhl-manual-this)
"xmap <Space><Space> <Plug>(quickhl-manual-this)
nmap <ESC><ESC> :noh<CR><Plug>(quickhl-manual-reset)
"xmap <ESC><ESC> <Plug>(quickhl-manual-reset)

"====================================================================
"yonchu/accelerated-smooth-scroll
"====================================================================
"nmap <silent> <S-j> <Plug>(ac-smooth-scroll-c-d)
"nmap <silent> <S-k> <Plug>(ac-smooth-scroll-c-u)

"====================================================================
"kien/ctrlp.vim
"====================================================================
nnoremap <Leader>; :CtrlP<CR>
nnoremap <Leader>: :CtrlPBuffer<CR>

"====================================================================
"tacahiroy/ctrlp-funky
"====================================================================
"nnoremap <Leader>p :CtrlPFunky<CR>

"====================================================================
"pelodelfuego/vim-swoop
"====================================================================
nmap <Leader>@ :call SwoopMulti()<CR>
vmap <Leader>@ :call SwoopMultiSelection()<CR>

"====================================================================
"MaxMEllon/vim-shiny
"====================================================================
nmap p  <Plug>(shiny-p)
nmap P  <Plug>(shiny-P)
nmap gp <Plug>(shiny-gp)
nmap gP <Plug>(shiny-gP)
