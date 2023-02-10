"================================
"Jetpack settings
"===============================

"fast install and starupt
"let g:jetpack_copy_method='symlink'


call jetpack#begin()

    "Library
    Jetpack 'tpope/vim-repeat'
    Jetpack 'nvim-lua/popup.nvim'
    Jetpack 'nvim-lua/plenary.nvim'
    Jetpack 'MunifTanjim/nui.nvim'
    Jetpack 'rcarriga/nvim-notify'
    Jetpack 'kyazdani42/nvim-web-devicons' " 色々なプラグインでiconを表示してくれる

    Jetpack 'b3nj5m1n/kommentary'          " コメントを追加
    Jetpack 'folke/todo-comments.nvim'     " TODOコメントの色を変更
    Jetpack 'folke/which-key.nvim'         " キーの案内を表示
    Jetpack 'glepnir/indent-guides.nvim'   " インデントに色を付ける
    Jetpack 'kevinhwang91/nvim-bqf'        " QuickFixウィンドウをカッコよくしれくれる
    Jetpack 'kevinhwang91/nvim-hlslens'    " 検索で何文字進めばいいのかを表示してくれる
    Jetpack 'romgrk/barbar.nvim'           " バッファの可視化
    Jetpack 'tversteeg/registers.nvim'     " registerの表示
    Jetpack 'nvim-lualine/lualine.nvim'    " status line

    " treesitter依存
    if executable('node')
        Jetpack 'nvim-treesitter/nvim-treesitter'             " treesitter
        " Jetpack 'code-biscuits/nvim-biscuits'               " ブロックの末尾に何のブロックかを表示する
        Jetpack 'p00f/nvim-ts-rainbow'                        " カッコの色を付ける
        Jetpack 'winston0410/smart-cursor.nvim'               " 行追加の際にインデントとかを上手いことしてくれる
        Jetpack 'JoosepAlviste/nvim-ts-context-commentstring' " カーソル位置に基づいてコメント文字を設定してくれる
        Jetpack 'windwp/nvim-ts-autotag'
        Jetpack 'yioneko/nvim-yati'                           " treesitterのインデントのバグを直してくれるらしい
        Jetpack 'romgrk/nvim-treesitter-context'              " 画面に収まらない関数を表示してくれる
        Jetpack 'nvim-treesitter-textobjects'                 " treesitterを使ってテキストオブジェクトを作成出来るようにする
        Jetpack 'm-demare/hlargs.nvim'                        " 引数に色を付ける
    endif

    if executable('yarn')
        Jetpack 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install','for':'markdown'}  "markdownのプレビューとかをよしなにやってくれる
    endif



    "color scheme
    Jetpack 'navarasu/onedark.nvim'                         " onedarkこそ神
    " Jetpack 'sainnhe/edge'                                  " 色々設定出来るクールなcolor scheme
    " Jetpack 'sainnhe/sonokai'                               " monokaiProベースのcolor scheme
    " Jetpack 'rebelot/kanagawa.nvim'                         " なんかよさげなカラースキーム

    " Lsp
    " Jetpack 'prabirshrestha/vim-lsp'                        " LSP
    " Jetpack 'mattn/vim-lsp-settings'                       " LSPインストール 

    Jetpack 'neovim/nvim-lspconfig'                         " LSP
    Jetpack 'williamboman/nvim-lsp-installer'               " LSPインストール
    Jetpack 'folke/lsp-colors.nvim'                         " 色設定を追加してくれる
    Jetpack 'folke/trouble.nvim'                            " 警告等を良い感じに表示してくれる
    Jetpack 'j-hui/fidget.nvim'                             " LSPの状態等を表示してくれる
    Jetpack 'kkharji/lspsaga.nvim'                          " UIとかコマンドの追加

    Jetpack 'hrsh7th/vim-vsnip'                             " snippet
    Jetpack 'hrsh7th/vim-vsnip-integ'                       " vim-vsnipを他プラグインと連携するようにする
    Jetpack 'rafamadriz/friendly-snippets'                  " 色んな言語のsnippet集

    Jetpack 'MattesGroeger/vim-bookmarks'                   " 行にブックマークを設定してくれる
    Jetpack 'Shougo/context_filetype.vim'                   " 埋め込みのコードでカーソルからfiletypeを認識してくれる
    Jetpack 'bronson/vim-trailing-whitespace'               " 空白の削除
    Jetpack 'godlygeek/tabular'                             " 文字揃えをうまいことしてくれる
    Jetpack 'itchyny/vim-highlighturl'                      " URLのハイライトを行う
    " Jetpack 'kuuote/gina-preview.vim'                       " gina拡張
    Jetpack 'lambdalisue/suda.vim'                          " 読み書きをsuduでしてくれる
    " Jetpack 'lambdalisue/vim-findent'                       " fileから適切なインデントを読み取ってくれる
    Jetpack 'liuchengxu/vista.vim'                          " コードの変数やオブジェクト等を表示してくれる
    Jetpack 'markonm/traces.vim'                            " 置換結果を変換前に表示する
    Jetpack 'mattn/vim-findroot'                            " プロジェクトのルートを設定してくれる
    Jetpack 'dhruvasagar/vim-table-mode',{'for':'markdown'} " markdownで上手い事テーブルを作れるモードを追加してくれる
    Jetpack 'mattn/vim-maketable',{'for':'markdown'}        " セパレータからテーブルを作成してくれる
    Jetpack 'mg979/vim-visual-multi'                        " マルチカーソル
    Jetpack 'plasticboy/vim-markdown', {'for':'markdown'}   " markdownのsyntax highlightを提供する
    Jetpack 'reireias/vim-cheatsheet'                       " 自分で設定したチートシートを表示する
    Jetpack 'simeji/winresizer'                             " windowのリサイズをおこなう
    Jetpack 't9md/vim-quickhl'                              " 選択文字のハイライトをしてくれる
    " Jetpack 'thinca/vim-localrc'                            " ローカル設定のvimrcを読み込む
    Jetpack 'thinca/vim-qfreplace'                          " quick fixで置換を行う
    Jetpack 'thinca/vim-quickrun'                           " バッファのコードをシュッと実行してくれる
    Jetpack 'tyru/capture.vim'                              " Exコマンドをバッファに書きだしてくれる
    Jetpack 'norcalli/nvim-colorizer.lua'                   " colorcodeに色を付けてくれる
    " Jetpack 'mvllow/modes.nvim'                             " modeをカーソルの色でわかるようにする
    Jetpack 'AndrewRadev/linediff.vim'                      " 選択範囲のdiffを取ってくれる
    Jetpack 'glidenote/memolist.vim'                        " メモ取り用
    Jetpack 'andymass/vim-matchup'                          " 括弧をマッチさせる
    Jetpack 'cohama/lexima.vim'                             " 閉じカッコの補完をしてくれる
    " Jetpack 'windwp/nvim-autopairs'                         " leximaみたいなやつ
    Jetpack 'rhysd/clever-f.vim'                            " f移動を簡単にする(f移動後に;ではなくfで移動出来るようにする)
    Jetpack 'SmiteshP/nvim-gps'                             " 現在の行の情報を表示してくれる
    Jetpack 'notomo/reacher.nvim'                           " 見えている範囲で検索する

    Jetpack 'voldikss/vim-translator'                       " 選択文字の翻訳をしてくれる

    Jetpack 'mattn/vim-goimports',{'for':'go'}              " Goでimportsとfmtを書き込み時に実行する
    Jetpack 'mattn/vim-goimpl',{'for':'go'}                 " interfaceを作成してくれる
    Jetpack 'mattn/vim-godoc',{'for':'go'}                  " godoc
    Jetpack 'mattn/vim-gomod',{'for':'go'}                  " modファイルのsyntax highlight
    Jetpack 'mattn/vim-goaddtags',{'for':'go'}              " tagを自動で付けてくれる
    Jetpack 'akinsho/flutter-tools.nvim'                    " flutterで開発出来るようにするプラグイン
    Jetpack 'previm/previm',{'for':'markdown'}              " markdownをpreviewする
    Jetpack 'petertriho/nvim-scrollbar'                     " スクロールバーを表示する
    Jetpack 'kristijanhusak/line-notes.nvim'                " 行にノートを埋めこむ

    "syntax
    Jetpack 'rhysd/vim-gfm-syntax', {'for':'markdown'} "markdownをもっとハイライトする

"deno
if executable('deno')
    Jetpack 'vim-denops/denops.vim'                     " denoのランタイム
    Jetpack 'vim-skk/skkeleton'                         " deno版skk
    Jetpack 'delphinus/skkeleton_indicator.nvim'        " skkeletonの状態を表示してくれる
    Jetpack 'matsui54/denops-popup-preview.vim'         " 補完候補のプレビュー
    Jetpack 'matsui54/denops-signature_help'            " signature help
    Jetpack 'monaqa/dps-dial.vim'                       " インクリメント、デクリメント拡張
    Jetpack 'lambdalisue/gin.vim'                       " git操作を出来るようにする

    "ddc
    Jetpack 'Shougo/ddc.vim'
    Jetpack 'Shougo/pum.vim'

    "source
    Jetpack 'Shougo/ddc-around'
    Jetpack 'LumaKernel/ddc-file'
    Jetpack 'Shougo/ddc-nvim-lsp'
    Jetpack 'shun/ddc-vim-lsp'
    Jetpack 'Shougo/ddc-cmdline-history'
    Jetpack 'Shougo/ddc-cmdline'
    Jetpack 'Shougo/neco-vim'
    Jetpack 'ippachi/ddc-yank'
    Jetpack 'gamoutatsumi/ddc-emoji'

    "matcher
    Jetpack 'Shougo/ddc-matcher_head'
    Jetpack 'tani/ddc-fuzzy'
    Jetpack 'takker99/ddc-bitap'

    "sorter
    Jetpack 'Shougo/ddc-sorter_rank'

    "converter
    Jetpack 'Shougo/ddc-converter_remove_overlap'

    "ddu
    Jetpack 'Shougo/ddu.vim'
    Jetpack 'Shougo/ddu-commands.vim'

    "ui
    Jetpack 'Shougo/ddu-ui-ff'
    Jetpack 'Shougo/ddu-ui-filer'

    "column
    Jetpack 'Shougo/ddu-column-filename'
    Jetpack 'ryota2357/ddu-column-icon_filename'

    "kind
    Jetpack 'Shougo/ddu-kind-file'

    "source
    Jetpack 'Shougo/ddu-source-file'
    Jetpack 'Shougo/ddu-source-file_rec'
    Jetpack 'Shougo/ddu-source-file_point'
    Jetpack 'Shougo/ddu-source-register'
    Jetpack 'shun/ddu-source-buffer'
    Jetpack 'shun/ddu-source-rg'
    Jetpack 'Shougo/ddu-source-line'
    Jetpack 'matsui54/ddu-source-file_external'
    Jetpack 'matsui54/ddu-source-command_history'
    Jetpack 'lambdalisue/mr.vim'
    Jetpack 'kuuote/ddu-source-mr'
    Jetpack 'matsui54/ddu-source-help'
    Jetpack '4513ECHO/ddu-source-colorscheme'
    Jetpack '4513ECHO/ddu-source-source'

    "matcher
    Jetpack 'Shougo/ddu-filter-matcher_substring'
    Jetpack 'yuki-yano/ddu-filter-fzf'
    Jetpack 'Shougo/ddu-filter-matcher_relative'
    Jetpack 'Shougo/ddu-filter-matcher_hidden'
endif

    "Filer
    Jetpack 'lambdalisue/fern.vim',{ 'branch': 'main' }
    Jetpack 'lambdalisue/nerdfont.vim'
    Jetpack 'lambdalisue/fern-renderer-nerdfont.vim'
    Jetpack 'lambdalisue/fern-git-status.vim'
    Jetpack 'lambdalisue/fern-mapping-project-top.vim'
    Jetpack 'lambdalisue/fern-hijack.vim'
    Jetpack 'lambdalisue/glyph-palette.vim'
    Jetpack 'yuki-yano/fern-preview.vim'

    "Others
    Jetpack 'twitvim/twitvim'
    Jetpack 'xolox/vim-misc'
    Jetpack 'tyru/open-browser.vim'
    Jetpack 'ryanoasis/vim-devicons'
    Jetpack 'akinsho/toggleterm.nvim'
    " Jetpack 'voldikss/vim-floaterm'

    "help
    Jetpack 'vim-jp/vimdoc-ja'

    "operator
    Jetpack 'kana/vim-operator-user'
    Jetpack 'kana/vim-operator-replace'
    Jetpack 'machakann/vim-sandwich'

    "text object
    Jetpack 'kana/vim-textobj-user'
    Jetpack 'glts/vim-textobj-comment'
    Jetpack 'kana/vim-textobj-entire'
    Jetpack 'kana/vim-textobj-function'
    Jetpack 'kana/vim-textobj-indent'
    Jetpack 'kana/vim-textobj-line'
    Jetpack 'machakann/vim-textobj-functioncall'
    Jetpack 'mattn/vim-textobj-url'
    Jetpack 'rhysd/vim-textobj-anyblock'
    Jetpack 'sgur/vim-textobj-parameter'
    Jetpack 'thinca/vim-textobj-between'

    if has('win32') || has('win64')
        Jetpack 'hachibeeDI/vim-vbnet', {'for':'vb'}    " VB.NET用のシンタックスとインデントを追加する
        Jetpack 'pprovost/vim-ps1',{'for':'powershell'} " PowerShellのFileTypeの追加等を行ってくれる
    endif

    " 未使用
    " Jetpack 'aiya000/aho-bakaup.vim'
    " Jetpack 'mfussenegger/nvim-dap'           "デバッガ
    " Jetpack 'Pocco81/DAPInstall.nvim'         "デバッガのインストール
    " Jetpack 'rcarriga/nvim-dap-ui'            "デバッガのUI拡張
    " Jetpack 'unblevable/quick-scope'          " fを押すとハイライトしてくれるようになる

call jetpack#end()



command! -nargs=1 UsePlugin if !jetpack#tap(<args>) | finish | endif
