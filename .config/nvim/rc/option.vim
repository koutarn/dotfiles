"disable defult plugins
"thx https://lambdalisue.hatenablog.com/entry/2015/12/25/000046
let g:loaded_gzip            = 1
let g:loaded_tar             = 1
let g:loaded_tarPlugin       = 1
let g:loaded_zip             = 1
let g:loaded_zipPlugin       = 1
let g:loaded_rrhelper        = 1
let g:loaded_vimball         = 1
let g:loaded_vimballPlugin   = 1
let g:loaded_getscript       = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_logiPat         = 1

"Terminalではmatchparenを停止
"thx https://lambdalisue.hatenablog.com/entry/2015/12/25/000046
if !has('gui_running')
  let g:loaded_matchparen = 1
endif

if has('unix')
  let $SHELL='/bin/zsh'
  set shell=/bin/zsh
elseif has('win32') || has('win64')
    set shell=cmd
endif

"補完
set completeopt+=menuone,menu,preview
set pumheight=10
set wildignorecase
if exists('&pumblend')
  set pumblend=10
endif

" プラグインの挙動を優先させたいので切る。
" set autochdir

set imdisable
set autoread
set startofline
set stal=0
set updatetime=300
set notitle
set showcmd
set nocursorline
set display=lastline
set laststatus=3
set nolist
set listchars=tab:\|\ ,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set ambiwidth=single
set iminsert=0
set imsearch=-1
set inccommand=split

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

"file
set nonumber
set norelativenumber
set ruler

"折り返し
set wrap
set wrapmargin=0

"検索/置換
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan
set nogdefault
set magic

set colorcolumn=0
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
set nobackup
set noswapfile
set splitbelow
set splitright
set undolevels=1000"
set shortmess+=c
set mouse=a
set isfname-==

"cmd window
set cmdwinheight=16
set cmdheight=0

if !has('nvim')
  set ttymouse=xterm2
endif

"terminal
set termguicolors
set t_ZH=
set t_ZR=
set t_Co=256

"thx https://github.com/kato-k/dotfiles/blob/5ea47516f3b9f5a425c827a1ebd859beb2ad4835/vimrc#L182
augroup vimrc_terminal
  autocmd!
  autocmd TermOpen * if &buftype == 'terminal' | silent! set nobuflisted | endif
augroup END

set helplang=ja,en
set nospell
set spelllang=en,cjk
set spelloptions=camel
set lazyredraw
set ttyfast
set timeoutlen=500
set ttimeoutlen=50
set shortmess+=I
set nofoldenable
set history=1000

"vimrc読書会でTsuyoshiさんに教えてもらった
if exists('+belloff')
    set belloff=all
else
    set noerrorbells
    set novisualbell
    set t_vb=
endif

"clipboard paste有効化(+レジスタに入れる)
set clipboard&
set clipboard^=unnamedplus

"ripgrepがあればデフォルトに設定
if executable('rg')
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
