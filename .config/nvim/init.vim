"               | |  / /   (_)   ____ ___    _____  _____
"               | | / /   / /   / __ `__ \  / ___/ / ___/
"               | |/ /   / /   / / / / / / / /    / /__
"               |___/   /_/   /_/ /_/ /_/ /_/     \___/
"
"=================================================================================

"encoding
set encoding=utf-8
set fileencodings=utf-8,cp932,sjis
set fileformats=unix,dos,mac
scriptencoding utf-8

"コマンドを初期化
augroup vimrc
  autocmd!
augroup END

"読み込みファイル設定
runtime! _config/*.vim

"deinに移行中
" execute 'source' fnamemodify(expand('<sfile>'), ':h').'/rc/vimrc'

"filetype
filetype on
filetype plugin on
filetype indent on

"syntax
syntax on
set background=dark
