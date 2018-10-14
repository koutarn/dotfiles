"================================
"vim plug settings
================================
if filereadable(expand("~/.vim/autoload/plug.vim"))
    call plug#begin()

        "表示補助
        Plug 'tomasr/molokai'                                               "molokai
        Plug 'bronson/vim-trailing-whitespace'                              "無駄な空白を可視化する
        Plug 'gko/vim-coloresque'                                           "色を視覚化にする
        Plug 'scrooloose/nerdtree'                                          "fileTree
        Plug 'jistr/vim-nerdtree-tabs'                                      "Nerdtreeをtabで扱いやすいようにする
        Plug 'myrobo/smart_tabline.vim'                                     "tabを見やすくする
        Plug 'Xuyuanp/nerdtree-git-plugin'                                  "nerdtreeで変更があったら表示する

        "コーディング補助
        Plug 'tpope/vim-surround'                                           "シングルクオートとダブルクオートを入れ替える
        Plug 'Yggdroot/indentLine'                                          "インデントの可視化
        Plug 'Townk/vim-autoclose'                                          "自動でカッコを閉じてくれる
        Plug 'tomtom/tcomment_vim'                                          "選択行のコメント化を簡単にする
        Plug 'szw/vim-tags'                                                 "Ctagsの拡張プラグイン
        Plug 'mattn/sonictemplate-vim'                                      "Template入力補助
        Plug 'thinca/vim-quickrun'                                          "その場で実行してくれる
        Plug 'suan/vim-instant-markdown'                                    "markdown作成補助

        "git関係
        Plug 'airblade/vim-gitgutter'                                       "signの領域にgitのstatusを表示する

       "Ruby
        Plug 'tpope/vim-endwise'                                            "自動でendを補完してくれる
        Plug 'todesking/ruby_hl_lvar.vim' , {'for':'Ruby'}                  "Rubyのローカル変数をハイライト
        Plug 'vim-scripts/ruby-matchit'                                     "Rubyのendも%で移動出来るようにする
        Plug 'thinca/vim-ref'                                               "Rubyのリファレンスマニュアルをvimで読めるようにする(ref gemを入れる必要あり)
        Plug 'osyo-manga/vim-monster',{'for':'Ruby'}                        "Rubyのコード補完機能を提供

        "rails
        Plug 'tpope/vim-rails'                                              "railsコマンドをvimでも使えるようにする

        "その他
        Plug 'dag/vim-fish'                                                 "Fish Scriptのシンタックスハイライト
        Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }   "fzf
        Plug 'junegunn/fzf.vim'                                             "fzfのvim用コード

    call plug#end()
end
