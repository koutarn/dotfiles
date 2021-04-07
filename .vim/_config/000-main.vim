set encoding=utf-8
scriptencoding utf8
set fileencodings=cp932,sjis,utf-8
set fileformats=dos,unix,mac

" コマンド初期化
augroup vimrc_init
  autocmd!
augroup END

if has('unix')
  let $SHELL='/bin/zsh'
  set shell=/bin/bash
elseif has('win32') || has('win64')
  set shell=cmd
endif

if has('nvim')
  set pumblend=10
endif

"自動で読み込み直す。
set autoread

set startofline
set autochdir
set stal=0
set pumheight=10
set updatetime=300
set notitle
set showcmd
set cursorline
set display=lastline
set laststatus=2
set nolist
set listchars=tab:\|\ ,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

set ambiwidth=double
syntax enable

set t_Co=256
set iminsert=0
set imsearch=-1

"tab
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=-1
set smarttab
set shiftround

"indent
set breakindent
set autoindent
set smartindent
set tm=500
set copyindent
set preserveindent
set backspace=indent,eol,start

"行番号もルーラーも表示しない
set nonumber
set noruler

"折り返し
set wrap
set wrapmargin=0

"検索/置換
set hlsearch
set incsearch
set ignorecase smartcase
set wrapscan
set nogdefault


set showmatch
set matchtime=1
set showbreak=>\ 
set wildmenu
set wildmode=list:longest,full
set matchpairs& matchpairs+=<:>
set infercase
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
set tm=500
set nofoldenable
set history=1000
set tm=500

"beep
set noerrorbells
set novisualbell

if has('unix')
  set clipboard&
  set clipboard^=unnamedplus
endif

if has('win32') && has('win64')
  set clipboard+=unnamed"
endif

set cmdheight=1

"thx tsuyoshicho
"https://github.com/tsuyoshicho/vimrc-reading/blob/7451171f07e88d6d1dcd73deb792aff115d2c94e/.vimrc
command! Utf8  edit ++encoding=utf-8 %
command! Cp932 edit ++encoding=cp932 %
command! Unix  edit ++fileformat=unix   %
command! Dos   edit ++fileformat=dos    %
command! AsUtf8 set 'fileencoding'=utf-8 | w
command! AsDos  set fileformat=dos     | w
command! AsUnix set fileformat=unix    | w
