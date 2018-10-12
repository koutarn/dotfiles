"================================
"表示設定     
"================================
set encoding=UTF-8                                                  "エンコードをUTF-8にする
set notitle                                                         "vimを使ってくれてありがとうにさようなら
set title                                                           "編集中のファイル名の表示
set showcmd                                                         "入力中のコマンドをステータスに表示する
set number                                                          "行番号を表示
set cursorline                                                      "現在の行を強調表示
set showmatch                                                       "括弧入力時に対応する括弧を表示
set laststatus=2                                                    "ステータスラインを常に表示
set ruler                                                           "ルーラーを表示する
set showtabline=2                                                   "tabバーを常に表示する
set laststatus=2                                                    "ステータスバーを常に表示する
set list                                                            "タブ、空白、改行を可視化にする
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%"     "タブ、空白、改行を可視化の文字を設定
set ambiwidth=double                                                "全角文字をvimで正しく認識させる設定
syntax enable 							                            "構文ハイライトを有効にする
"================================
"検索設定
"================================
set nohlsearch                                                      "検索時の強調表示をやめる
set smartcase                                                       "検索文字に大文字が含まれる場合は区別して検索する
set wrapscan                                                        "検索時に最後まで移動したら最初に戻る
set incsearch                                                       "インクリメンタルサーチを有効にする
set ignorecase                                                      "大文字と小文字を区別せず検索する
set matchtime=1                                                     "カーソルが飛ぶ時間を変更
"================================
"Tab
"================================
set autoindent                                                      "自動インデント
set expandtab                                                       "タブ文字をスペースにする
set tabstop=4                                                       "タブ幅を4文字にする
set smarttab                                                        "コンテキストに応じたタブの処理を行う
set wildmenu                                                        "コマンドモードの補完
set wildmode=list:longest,full                                      "コマンドラインの補完方法を設定する
set matchpairs& matchpairs+=<:>"                                    "対応括弧に<と>のペアを追加
set smartindent                                                     "改行入力行の末尾にあわせてインデントを増減する
set shiftround                                                      "インデントをshiftwidthの倍数に丸める
set shiftwidth=4                                                    "自動で挿入されるタブ幅　
set softtabstop=0                                                   "タブ幅をtabstopの値に任せる
set ai                                                              "自動字下げ
"================================
"補完
"================================
set pumheight=10                                                    "補完の幅を10にする
set infercase                                                       "補完の際の大文字小文字の区別しない
"================================
"文字移動
"================================
set backspace=indent,eol,start                                      "Backspaceキーの影響範囲に制限を設けない
set whichwrap=b,s,h,l,<,>,[,]                                       "行頭行末の左右移動で行をまたぐ
set scrolloff=8                                                     "上下8行の視界を確保
set sidescrolloff=16                                                "左右スクロール時の視界を確保
set sidescroll=1                                                    "左右スクロールは一文字づつ行う
set virtualedit=all                                                 "文字がない場所にもカーソルを移動できるようにする
"================================
"ファイル処理関連の設定
"================================
set confirm                                                         "保存されていないファイルがあるときは終了前に保存確認
set hidden                                                          "保存されていないファイルがあるときでも別のファイルを開くことが出来る
set autoread                                                        "外部でファイルに変更がされた場合は読みなおす
set nobackup                                                        "ファイル保存時にバックアップファイルを作らない
set noswapfile                                                      "ファイル編集中にスワップファイルを作らない
set splitbelow                                                      "新しいウィンドウを下に開く"
set splitright                                                      "新しいウィンドウを右に開く" 
"================================
"マウス設定
"================================
set mouse=a                                                         "mouseを使えるようにする"
set ttymouse=xterm2

"カラースキームの指定
if filereadable(expand("~/.vim/colors/molokai.vim"))
    colorscheme molokai
    "highlight Normal ctermbg=NONE guibg=NONE
    "highlight NonText ctermbg=NONE guibg=NONE
    "highlight SpecialKey ctermbg=NONE guibg=NONE
    "highlight EndOfBuffer ctermbg=NONE guibg=NONE
    let g:molokai_original = 1
end

"自動コンプリート"
set completeopt=menuone
for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
    exec "imap " . k . " " . k . "<C-N><C-P>"
endfor
imap <expr> <TAB> pumvisible() ? "\<Down>" : "\<Tab>"

""""""""""""""""""""""""""""""
" 挿入モード時、ステータスラインの色を変更
""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')

  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction
""""""""""""""""""""""""""""""
