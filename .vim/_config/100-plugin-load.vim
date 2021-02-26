"================================
"vim plug settings
"===============================

"Vim Plug auto load
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if filereadable(expand("~/.vim/autoload/plug.vim"))
  call plug#begin()

  "linux環境のみ
  if has('unix')
    Plug 'chriskempson/base16-vim'                  " base16
    Plug 'airblade/vim-gitgutter'   , {'for':'Git'} " signの領域にgitのstatusを表示する
    Plug 'b4b4r07/vim-shellutils'                   " Commandを使いやすくする
  endif

  "LSP
  Plug 'prabirshrestha/vim-lsp'                     " LSP設定
  Plug 'prabirshrestha/asyncomplete.vim'            " 入力補完
  Plug 'prabirshrestha/asyncomplete-lsp.vim'        " 入力補完
  Plug 'prabirshrestha/vim-lsp'
  Plug 'mattn/vim-lsp-settings'
  Plug 'mattn/vim-lsp-icons'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'hrsh7th/vim-vsnip-integ'

  "Coding
  " Plug 'bronson/vim-trailing-whitespace'            " 無駄な空白を可視化する
  Plug 'godlygeek/tabular'                          " 整形する
  Plug 'mhinz/vim-sayonara'                         " buff削除用
  Plug 'luochen1990/rainbow'                        " 括弧を虹色にする。
  Plug 'tyru/capture.vim'                           " コマンド結果を新規バッファに書きだす
  Plug 't9md/vim-quickhl'                           " 特定の文字をハイライトする。
  Plug 'Townk/vim-autoclose'                        " 自動でカッコを閉じてくれる
  Plug 'ap/vim-buftabline'                          " bufferをタブとして表示
  Plug 'mg979/vim-visual-multi'                     " multiple-cursor機能を提供する
  Plug 'scrooloose/nerdcommenter'                   " コメント機能拡張
  Plug 'simeji/winresizer'

  "Writ
  Plug 'skanehira/preview-markdown.vim'
  Plug 'plasticboy/vim-markdown'                    " markdown用のsyntax

  "Rooting
  Plug 'itchyny/lightline.vim'                      " LightLine
  Plug 'mattn/vim-findroot'
  Plug 'MattesGroeger/vim-bookmarks'                " 行にブックマークを入れる事が出来るようにする
  Plug 'mattn/vim-molder'

  "Joke
  Plug 'monaqa/vim-duzzle'

  "ather
  Plug 'twitvim/twitvim'                            " Vimでツイッター
  Plug 'vim-jp/vimdoc-ja'                           " vimhelp jpfile
  Plug 'xolox/vim-misc'                             " plugin開発のためのスクリプト群(他のプラグインのために使用)

  "operator
  Plug 'kana/vim-operator-user'                     " operator強化
  Plug 'kana/vim-operator-replace'                  " operator 入れ替え
  Plug 'rhysd/vim-operator-surround'                " operator 囲み
  " Plug 'osyo-manga/vim-operator-search'             " operator 検索
  " Plug 'vimtaku/vim-operator-mdurl'                 " markdownでurl形式にする

  "text object
  Plug 'kana/vim-textobj-user'                      " text-object強化
  Plug 'glts/vim-textobj-comment'                   " text-object コメント c
  Plug 'kana/vim-textobj-function'                  " text-object 関数 F
  Plug 'kana/vim-textobj-indent'                    " text-object インデント i
  Plug 'kana/vim-textobj-line'                      " text-object ライン l
  Plug 'rhysd/vim-textobj-anyblock'                 " text-object 対応ブロックを増やす b
  Plug 'thinca/vim-textobj-between'                 " text-object 特定の文字に囲まれた範囲 f
  Plug 'deton/textobj-nonblankchars.vim'            " text-object wordを日本語に対応させる

  call plug#end()
end

"Are you using plugins?
let s:plugs = get(s:, 'plugs', get(g:, 'plugs', {}))
function! FindPlugin(name) abort
  return has_key(s:plugs, a:name) ? isdirectory(s:plugs[a:name].dir) : 0
endfunction
command! -nargs=1 UsePlugin if !FindPlugin(<args>) | finish | endif
