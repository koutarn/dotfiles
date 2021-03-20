"================================
"表示設定
"================================
set stal=0

if has('unix')
  let $SHELL='/bin/zsh'
  set shell=/bin/bash
  set encoding=utf-8
elseif has('win32') || has('win64')
  set shell=cmd
endif

if has ('nvim')
  set pumblend=10
endif

set pumheight=10
set autoread
set autochdir
set fileencodings=utf-8,cp932,sjis
set fileformats=unix,dos
set updatetime=300
set title
set showcmd
set nonumber
set cursorline
set showmatch
set display=lastline
set ruler
set laststatus=2
set nolist
set listchars=tab:\|\ ,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

set ambiwidth=double
syntax enable

set t_Co=256
set iminsert=0
set imsearch=-1

set wrap
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
set infercase
set backspace=indent,eol,start
set whichwrap=b,<,>,[,]
set scrolloff=40
set sidescrolloff=16
set sidescroll=1
set virtualedit=block
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

set mouse=a

if !has('nvim')
  set ttymouse=xterm2
endif

set termguicolors

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
  autocmd BufNewFile,BufRead *.vb setfiletype vb
  autocmd BufNewFile,BufRead *.cls setfiletype vb
  autocmd BufNewFile,BufRead *.bas setfiletype vb
augroup END
