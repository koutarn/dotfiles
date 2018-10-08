"================================
"vim plug settings
"================================
if filereadable(expand("~/.vim/autoload/plug.vim"))
    call plug#begin()
        Plug 'tomasr/molokai'                               "molokai
        Plug 'Yggdroot/indentLine'                          "インデントの可視化
        Plug 'scrooloose/nerdtree'                          "fileTree
        Plug 'jistr/vim-nerdtree-tabs'                      "Nerdtreeをtabで扱いやすいようにする
        Plug 'todesking/ruby_hl_lvar.vim' , {'for':'Ruby'}  "Rubyのローカル変数をハイライト
        Plug 'rhysd/accelerated-jk'                         "カーソル移動の加速
        Plug 'tpope/vim-endwise'                            "自動end補完
        Plug 'Townk/vim-autoclose'                          "自動でカッコを閉じてくれる
        Plug 'osyo-manga/vim-monster',{'for':'Ruby'}        "Rubyのコード補完機能を提供
        Plug 'tomtom/tcomment_vim'                          "選択行のコメント化を簡単にする
        Plug 'tpope/vim-surround'                           "シングルクオートとダブルクオートを入れ替える
        Plug 'gko/vim-coloresque'                           "色を視覚化にする
        Plug 'airblade/vim-gitgutter'                       "signの領域にgitのstatusを表示する
        Plug 'szw/vim-tags'                                 "Ctagsの拡張プラグイン
    call plug#end()        
end
