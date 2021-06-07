"=================================================================================
"                _    __    _
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
set nobomb

"filetype
filetype on
filetype plugin on
filetype indent on

"読み込みファイル設定
set runtimepath+=~/.vim/
runtime! _config/*.vim             "設定読み込み

"syntax
syntax on
set background=dark
