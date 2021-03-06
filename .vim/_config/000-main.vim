"================================
"表示設定
"================================
set stal=0

if has('unix')
  set shell=/bin/zsh
  let $SHELL='/bin/zsh'
  set encoding=utf-8
elseif has('win32') || has('win64')
  set shell=cmd
endif

set fileencodings=utf-8,cp932,sjis
set pumblend=40
set updatetime=300
set fileformats=unix,dos
set title
set showcmd
set number
set cursorline
set showmatch
set display=lastline
set laststatus=1
set ruler
set laststatus=2
set list
set listchars=tab:\|\ ,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

set ambiwidth=double
syntax enable

"補完の表示色を変更する
highlight Pmenu ctermfg=white ctermbg=black
highlight PmenuSel ctermfg=white ctermbg=gray
set t_Co=256

set iminsert=0
set imsearch=-1

set hlsearch
set wrapscan
set incsearch
set matchtime=1
set ignorecase smartcase
set breakindent
set showbreak=>\ 
set expandtab
set tabstop=4
set smarttab
set wildmenu
set wildmode=list:longest,full
set matchpairs& matchpairs+=<:>
set shiftround
set shiftwidth=4
set softtabstop=0
set autoindent
set smartindent
"================================
"補完
"================================
set pumheight=10
set infercase
"================================
"文字移動
"================================
set backspace=indent,eol,start
set whichwrap=b,<,>,[,]
set scrolloff=30
set sidescrolloff=16
set sidescroll=1

set virtualedit=block
"================================
"ファイル処理関連の設定
"================================
set nrformats=alpha,bin,hex
set confirm
set hidden
set autoread
set nobackup
set noswapfile
set splitbelow
set splitright
set undolevels=1000"
set shortmess+=c

"mouse
set mouse=a

if !has('nvim')
  set ttymouse=xterm2
endif

set termguicolors

"================================
"その他
"================================
set helplang=ja,en
set lazyredraw
set ttyfast
set timeout timeoutlen=1000 ttimeoutlen=50
set shortmess+=I
set nofoldenable
set history=1000
set noerrorbells
set novisualbell
set t_vb=
set tm=500

if has('unix')
  set clipboard&
  set clipboard^=unnamedplus
endif

if has('win32') && has('win64')
  set clipboard+=unnamed"
endif

set cmdheight=1

"File Type

augroup vimrc
  filetype on
  filetype plugin on
  filetype indent on

  autocmd!
  autocmd BufNewFile,BufRead *.c setfiletype c syntax=c
  autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
  autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
  autocmd BufNewFile,BufRead *.txt setlocal filetype=markdown
  autocmd BufNewFile,BufRead *.fish setlocal filetype=fish
  autocmd FileType markdown   setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab
  autocmd FileType apache     setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab
  autocmd FileType css        setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab
  autocmd FileType diff       setlocal shiftwidth=4 softtabstop=4 tabstop=4 noexpandtab
  autocmd FileType xml        setlocal shiftwidth=4 softtabstop=4 tabstop=4 noexpandtab
  autocmd FileType java       setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab
  autocmd FileType sql        setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab
  autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
  autocmd FileType ruby       setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
  autocmd FileType eruby      setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
  autocmd FileType yaml       setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
  autocmd FileType coffee     setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
  autocmd FileType tex        setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
  autocmd FileType html       setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
  autocmd FileType sql        setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
  autocmd FileType sh         setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
  autocmd FileType vim        setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
  autocmd FileType bash       setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
  autocmd FileType zsh        setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
  autocmd FileType fish       setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
  autocmd BufNewFile,BufRead *.vb setfiletype vbnet
  autocmd BufNewFile,BufRead *.cls setfiletype vbnet
  autocmd BufNewFile,BufRead *.bas setfiletype vbnet
augroup END

