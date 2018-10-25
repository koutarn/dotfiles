"================================
"vim plug settings
"================================
if filereadable(expand("~/.vim/autoload/plug.vim"))
    call plug#begin()

        "color scheme
        Plug 'tomasr/molokai'                                               "molokai
        Plug 'junegunn/seoul256.vim'                                        "seoul256

        "表示補助
        Plug 'bronson/vim-trailing-whitespace'                              "無駄な空白を可視化する
        Plug 'gko/vim-coloresque'                                           "色を視覚化にする
        Plug 'myrobo/smart_tabline.vim'                                     "tabを見やすくする

        Plug 'scrooloose/nerdtree'                                          "fileTree
        Plug 'jistr/vim-nerdtree-tabs'                                      "Nerdtreeをtabで扱いやすいようにする
        Plug 'Xuyuanp/nerdtree-git-plugin'                                  "nerdtreeで変更があったら表示する
        Plug 'ko2ic/nerdtree-plugin-ag'                                     "nerdtreeでagを使えるようにする

        "検索
        Plug 'rking/ag.vim'                                                 "agを使えるようにする

        "コーディング補助
        Plug 'tpope/vim-surround'                                           "シングルクオートとダブルクオートを入れ替える
        Plug 'Yggdroot/indentLine'                                          "インデントの可視化
        Plug 'Townk/vim-autoclose'                                          "自動でカッコを閉じてくれる
        Plug 'tomtom/tcomment_vim'                                          "選択行のコメント化を簡単にする
        Plug 'szw/vim-tags'                                                 "Ctagsの拡張プラグイン
        Plug 'thinca/vim-quickrun'                                          "その場で実行してくれる
        Plug 'suan/vim-instant-markdown'                                    "markdown作成補助
        Plug 'haya14busa/vim-edgemotion'                                    "端に移動出来るようにする
        Plug 'AndrewRadev/switch.vim'                                       "文字列のtoggleを行う(faleseとtrueを変換出来たりする)
        Plug 'majutsushi/tagbar'                                            "tagbar表示
        Plug 'sheerun/vim-polyglot'                                         "vimの言語サポートを行う

        "git関係
        Plug 'airblade/vim-gitgutter'                                       "signの領域にgitのstatusを表示する

       "Ruby
        Plug 'tpope/vim-endwise'                                            "自動でendを補完してくれる
        Plug 'todesking/ruby_hl_lvar.vim' , {'for':'Ruby'}                  "Rubyのローカル変数をハイライト
        Plug 'vim-scripts/ruby-matchit'                                     "Rubyのendも%で移動出来るようにする
        Plug 'thinca/vim-ref'                                               "Rubyのリファレンスマニュアルをvimで読めるようにする(ref gemを入れる必要あり)
        Plug 'osyo-manga/vim-monster',{'for':'Ruby'}                        "Rubyのコード補完機能を提供

        "HTML
        Plug 'othree/html5.vim'                                             "HTML Syntax
        Plug 'hail2u/vim-css3-syntax'                                       "CSS Syntax
        Plug 'mattn/emmet-vim'                                              "Emmet

        "rails
        Plug 'tpope/vim-rails'                                              "railsコマンドをvimでも使えるようにする

        "その他
        Plug 'dag/vim-fish'                                                 "Fish Scriptのシンタックスハイライト
        Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }   "fzf
        Plug 'junegunn/fzf.vim'                                             "fzfのvim用コード
        Plug 'junegunn/goyo.vim'                                            "vimで文章を書く

    call plug#end()
end
