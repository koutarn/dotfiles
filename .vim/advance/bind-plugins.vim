"====================================================================
"vim-scripts/wimproved.vim
"====================================================================
map <F1> :WToggleFullscreen<CR>

"====================================================================
"'thinca/vim-fontzoom'
"====================================================================
map <F2> :Fontzoom 10<CR>
map <F3> :Fontzoom 11<CR>

"====================================================================
"scrooloose/nerdtree
"====================================================================
map <F4> :NERDTreeToggle<CR>
silent! map <F5> :NERDTreeFind<CR>

"====================================================================
"Ctags Create
"====================================================================
map <F6> :!ctags -R .<CR>

"====================================================================
"'godlygeek/tabular'
"====================================================================
vmap <Leader><Leader> :Tabularize /

"====================================================================
"Lokaltog/vim-easymotion
"====================================================================
map f <Plug>(easymotion-s2)

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
nnoremap sx :Sayonara!<cr>:bnext<cr>

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
nmap <Space>m <Plug>(quickhl-manual-this)
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

" "====================================================================
" "pelodelfuego/vim-swoop
" "====================================================================
" nmap <Leader>@ :call SwoopMulti()<CR>
" vmap <Leader>@ :call SwoopMultiSelection()<CR>

"====================================================================
"MaxMEllon/vim-shiny
"====================================================================
nmap p  <Plug>(shiny-p)
nmap P  <Plug>(shiny-P)
nmap gp <Plug>(shiny-gp)
nmap gP <Plug>(shiny-gP)

"====================================================================
"rhysd/vim-operator-surround
"====================================================================
map <silent>sa <Plug>(operator-surround-append)
map <silent>sd <Plug>(operator-surround-delete)<Plug>(textobj-anyblock-a)
map <silent>sr <Plug>(operator-surround-replace)<Plug>(textobj-anyblock-a)

"====================================================================
" kana/vim-textobj-function
"====================================================================
let g:textobj_function_no_default_key_mappings=0
omap iF <Plug>(textobj-function-i)
omap aF <Plug>(textobj-function-a)
vmap iF <Plug>(textobj-function-i)
vmap aF <Plug>(textobj-function-a)
"====================================================================
"kana/vim-operator-replace
"====================================================================
nmap R <Plug>(operator-replace)

"====================================================================
"mg979/vim-visual-multi
"====================================================================
"let g:VM_default_mappings          = 0
let g:VM_mouse_mappings             = 1
let g:VM_leader                     = ';'
let g:VM_theme                      = 'neon'
let g:VM_maps                       = {}
let g:VM_manual_infoline            = 0
let g:VM_maps['Find Subword Under'] = '<C-n>'
let g:VM_maps['Find Under']         = '<C-n>'
let g:VM_maps["Add Cursor Up"]      = '<C-k>'
let g:VM_maps["Select l"]           = '<C-l>'
let g:VM_maps["Select h"]           = '<C-h>'
let g:VM_maps["Add Cursor Down"]    = '<C-j>'
let g:VM_maps["Add Cursor At Pos"]  = '<Leader>n'
let g:VM_maps["Increase"]           = '<Up>'
let g:VM_maps["Decrease"]           = '<Down>'
let g:VM_maps["J"]                  = 'M-j'

"====================================================================
"xolox/vim-session
"====================================================================
nmap <Leader>[ :OpenSession<CR>
let g:session_autoload = 'no'
let g:session_autosave = 'no'
let g:session_verbose_messages = 0
let g:session_persist_colors = 0

"====================================================================
"t9md/vim-choosewin
"====================================================================
nmap <Leader><Space> <Plug>(choosewin)
let g:choosewin_overlay_enable          = 1
let g:choosewin_overlay_clear_multibyte = 1
let g:choosewin_label = 'asdfhjkl'  "homeポジションで移動できるようにする
let g:choosewin_blink_on_land = 0


"====================================================================
"mattn/ctrlp-launcher
"====================================================================
nnoremap <Leader>@ :<c-u>CtrlPLauncher<cr>


"====================================================================
" vim-ctrlp-cmdpalette
"====================================================================
nnoremap <Leader>] :CtrlPCmdPalette<CR>
