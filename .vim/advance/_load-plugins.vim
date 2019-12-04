"================================
"vim plug settings
"===============================
"if has('git')
if filereadable(expand("~/.vim/autoload/plug.vim"))
  call plug#begin()

  "linux環境のみ
  if has('unix')
    Plug 'chriskempson/base16-vim'                                      "base16
    Plug 'mattn/emmet-vim'                                              "Emmet
    Plug 'Xuyuanp/nerdtree-git-plugin' , {'for':'Git'}                  "nerdtreeで変更があったら表示する
    Plug 'airblade/vim-gitgutter'   , {'for':'Git'}                     "signの領域にgitのstatusを表示する
    Plug 'b4b4r07/vim-shellutils'                                       "Commandを使いやすくする
  endif

  "Windows環境のみ
  if has('win32') || has('win64')
    Plug 'haishanh/night-owl.vim'                                       "colorscheme
    Plug 'jdkanani/vim-material-theme'                                  "colorscheme
    Plug 'morhetz/gruvbox'                                              "colorscheme
    Plug 'w0ng/vim-hybrid'                                              "colorscheme
    Plug 'icymind/NeoSolarized'                                         "colorscheme
    Plug 'ayu-theme/ayu-vim'                                            "colorscheme

    Plug 'simeji/winresizer'                                            "画面をリサイズしやすくす
    Plug 'vim-scripts/wimproved.vim'                                    "windows用、画面の切り替え
    Plug 'thinca/vim-fontzoom'                                          "windows用、フォントサイズ切り替え
    " Plug 'vim-scripts/AutoComplPop'                                    "補完
    Plug 'Shougo/neocomplete.vim'                                       "補完
    Plug 'Shougo/neco-syntax'                                           "syntax補完
  endif

  Plug 'joshdick/onedark.vim'                                         "colorscheme
  Plug 'bronson/vim-trailing-whitespace'                              "無駄な空白を可視化する
  Plug 'scrooloose/nerdtree'     , {'on' : 'NERDTreeToggle'}          "ファイルツリー
  Plug 'jistr/vim-nerdtree-tabs' , {'on' : 'NERDTreeToggle'}          "Nerdtreeをtabで扱いやすいようにする
  Plug 'ryanoasis/vim-devicons'                                       "nerdtreeにアイコンを表示する
  Plug 'itchyny/lightline.vim'                                        "powerlineみたいな奴
  Plug 'Lokaltog/vim-easymotion'                                      "爆速で移動する
  Plug 'godlygeek/tabular'                                            "整形する
  Plug 'plasticboy/vim-markdown'                                      "markdown用のsyntax
  Plug 'szw/vim-tags'                                                 "Ctagsの拡張プラグイン
  Plug 'majutsushi/tagbar'                                            "tagbar表示
  Plug 'sheerun/vim-polyglot'                                         "vimの言語サポートを行う
  Plug 'vim-jp/vimdoc-ja'                                             "vimhelp jpfile
  Plug 'mhinz/vim-sayonara'                                           "buff削除用
  Plug 'KeyboardFire/vim-minisnip'                                    "snipet
  Plug 'drmingdrmer/vim-toggle-quickfix'                              "QuickFix
  Plug 'nazo/pt.vim'                                                  "pt
  Plug 'kien/ctrlp.vim'                                               "ファイル検索など
  Plug 'luochen1990/rainbow'                                          "括弧を虹色にする。
  Plug 'tyru/capture.vim'                                             "コマンド結果を新規バッファに書きだす
  Plug 'tyru/restart.vim'                                             "再起動をできるようにする
  Plug 't9md/vim-quickhl'                                             "特定の文字をハイライトする。
  Plug 'Townk/vim-autoclose'                                          "自動でカッコを閉じてくれる
  Plug 'jceb/vim-orgmode'  , {'for':'org'}                            "org-modeを提供する。
  Plug 'tpope/vim-speeddating', {'for':'org'}                         "org-modeのために入れる
  Plug 'vim-scripts/utl.vim', {'for':'org'}                           "org-modeのために入れる
  Plug 'paroxayte/vwm.vim'                                            "レイアウトマネージャー
  Plug 'gko/vim-coloresque'                                           "色を視覚化にする
  Plug 'ap/vim-buftabline'                                            "bufferをタブとして表示
  Plug 'mg979/vim-visual-multi'                                       "multiple-cursor機能を提供する
  Plug 'justinmk/vim-gtfo'                                            "ファイルを開く
  Plug 'mg979/vim-colortweaks'                                        "colorschemeの設定を拡張する。
  Plug 'xolox/vim-colorscheme-switcher'                               "colorschemeの設定を拡張する。
  Plug 'xolox/vim-misc'                                               "plugin開発のためのスクリプト群(他のプラグインのために使用)
  Plug 'MattesGroeger/vim-bookmarks'                                  "行にブックマークを入れる事が出来るようにする
  Plug 'MaxMEllon/vim-shiny'                                          "ペーストした箇所をハイライトする
  Plug 'xolox/vim-session'                                            "sessionを保存したり復元したりする
  Plug 't9md/vim-choosewin'                                           "window移動をグラフィカルにできるようにする
  Plug 'mattn/ctrlp-launcher'                                         "CtrlP拡張 ランチャー機能を提供
  Plug 'scrooloose/nerdcommenter'                                     "コメント機能拡張
  Plug 'junegunn/goyo.vim'                                            "散文モードを提供
  Plug 'junegunn/limelight.vim'                                       "特定の箇所を光らせる
  Plug 'unkiwii/vim-nerdtree-sync'                                    "NERDTree拡張 現在のファイルをsyntax
  Plug 'greggerz/nerdtree-svn-plugin'                                 "NERDTree拡張 SVN
  Plug 'fisadev/vim-ctrlp-cmdpalette'                                 "CtrlP拡張 コマンド用
  Plug 'irrationalistic/vim-tasks'                                    "タスク管理
  Plug 'sheldonirwin/bookmark-switcher'                               "NERDTree拡張 ブックマークの拡張

  "operator
  Plug 'kana/vim-operator-user'                                       "operator強化
  Plug 'kana/vim-operator-replace'                                    "operator 入れ替え
  Plug 'rhysd/vim-operator-surround'                                  "operator 囲み
  Plug 'osyo-manga/vim-operator-search'                               "operator 検索
  Plug 'vimtaku/vim-operator-mdurl'                                   "markdownでurl形式にする

  "text object
  Plug 'kana/vim-textobj-user'                                        "text-object強化
  Plug 'glts/vim-textobj-comment'                                     "text-object コメント c
  Plug 'kana/vim-textobj-function'                                    "text-object 関数 F
  Plug 'kana/vim-textobj-indent'                                      "text-object インデント i
  Plug 'kana/vim-textobj-line'                                        "text-object ライン l
  Plug 'rhysd/vim-textobj-anyblock'                                   "text-object 対応ブロックを増やす b
  Plug 'thinca/vim-textobj-between'                                   "text-object 特定の文字に囲まれた範囲 f
  Plug 'deton/textobj-nonblankchars.vim'                              "text-object wordを日本語に対応させる

  call plug#end()
end

" if has('win32') || has('win64')
"   "kaoriya vim無効化
"   let plugin_hz_ja_disable = 1
" endif
