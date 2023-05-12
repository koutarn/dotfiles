"=================================================================================
"               | |  / /   ('_')   ____ ___    _____  _____
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
runtime! rc/*.vim
"  runtime! rc/plugins/*.vim

" lua
runtime! lua/plugins/*.lua

"filetype
filetype on
filetype plugin on
filetype indent on

"syntax
syntax on
set background=dark

"dein Scripts-----------------------------

let $CACHE = expand('~/.cache')
if !isdirectory($CACHE)
  call mkdir($CACHE, 'p')
endif
if &runtimepath !~# '/dein.vim'
  let s:dein_dir = fnamemodify('dein.vim', ':p')
  if !isdirectory(s:dein_dir)
    let s:dein_dir = $CACHE .. '/dein/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif
  endif
  execute 'set runtimepath^=' .. substitute(
        \ fnamemodify(s:dein_dir, ':p') , '[/\\]$', '', '')
endif

let g:dein#auto_remote_plugins = v:false
let g:dein#enable_notification = v:true
let g:dein#install_check_diff = v:true
let g:dein#install_check_remote_threshold = 24 * 60 * 60
let g:dein#install_progress_type = 'floating'
let g:dein#lazy_rplugins = v:true
let g:dein#types#git#enable_partial_clone = v:true


" Set dein base path (required)
let s:dein_base = expand('~/.cache/dein')

" Set dein source path (required)
let s:dein_src = s:dein_base . '/repos/github.com/Shougo/dein.vim'

" Set dein runtime path (required)
execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')

" Call dein initialization (required)
call dein#begin(s:dein_base)
call dein#add(s:dein_src)
call dein#add('wsdjeg/dein-ui.vim')

call dein#add('tpope/vim-repeat')
call dein#add('nvim-lua/popup.nvim')
call dein#add('nvim-lua/plenary.nvim')
call dein#add('MunifTanjim/nui.nvim')
call dein#add('rcarriga/nvim-notify')
call dein#add('kyazdani42/nvim-web-devicons') " 色々なプラグインでiconを表示してくれる

call dein#add('b3nj5m1n/kommentary')          " コメントを追加
call dein#add('folke/todo-comments.nvim')     " TODOコメントの色を変更
call dein#add('folke/which-key.nvim')         " キーの案内を表示
call dein#add('glepnir/indent-guides.nvim')   " インデントに色を付ける
call dein#add('kevinhwang91/nvim-bqf')        " QuickFixウィンドウをカッコよくしれくれる
call dein#add('kevinhwang91/nvim-hlslens')    " 検索で何文字進めばいいのかを表示してくれる
call dein#add('romgrk/barbar.nvim')           " バッファの可視化
call dein#add('tversteeg/registers.nvim')     " registerの表示
call dein#add('nvim-lualine/lualine.nvim')    " status line

" treesitter依存
if executable('node')
    call dein#add('nvim-treesitter/nvim-treesitter')             " treesitter
    " call dein#add('code-biscuits/nvim-biscuits')               " ブロックの末尾に何のブロックかを表示する
    call dein#add('p00f/nvim-ts-rainbow')                        " カッコの色を付ける
    call dein#add('winston0410/smart-cursor.nvim')               " 行追加の際にインデントとかを上手いことしてくれる
    call dein#add('JoosepAlviste/nvim-ts-context-commentstring') " カーソル位置に基づいてコメント文字を設定してくれる
    call dein#add('windwp/nvim-ts-autotag')
    call dein#add('yioneko/nvim-yati')                           " treesitterのインデントのバグを直してくれるらしい
    call dein#add('romgrk/nvim-treesitter-context')              " 画面に収まらない関数を表示してくれる
    call dein#add('nvim-treesitter-textobjects')                 " treesitterを使ってテキストオブジェクトを作成出来るようにする
    call dein#add('m-demare/hlargs.nvim')                        " 引数に色を付ける
endif

if executable('(yarn)')
    call dein#add('iamcco/markdown-preview.nvim') "markdownのプレビューとかをよしなにやってくれる
endif



"color scheme
call dein#add('navarasu/onedark.nvim')                         " onedarkこそ神
" call dein#add('sainnhe/edge')                                  " 色々設定出来るクールなcolor scheme
" call dein#add('sainnhe/sonokai')                               " monokaiProベースのcolor scheme
" call dein#add('rebelot/kanagawa.nvim')                         " なんかよさげなカラースキーム

" Lsp
" call dein#add('prabirshrestha/vim-lsp')                        " LSP
" call dein#add('mattn/vim-lsp-settings')                       " LSPインストール 

call dein#add('neovim/nvim-lspconfig')                         " LSP
call dein#add('williamboman/nvim-lsp-installer')               " LSPインストール
call dein#add('folke/lsp-colors.nvim')                         " 色設定を追加してくれる
call dein#add('folke/trouble.nvim')                            " 警告等を良い感じに表示してくれる
call dein#add('j-hui/fidget.nvim')                             " LSPの状態等を表示してくれる
call dein#add('kkharji/lspsaga.nvim')                          " UIとかコマンドの追加

call dein#add('hrsh7th/vim-vsnip')                             " snippet
call dein#add('hrsh7th/vim-vsnip-integ')                       " vim-vsnipを他プラグインと連携するようにする
call dein#add('rafamadriz/friendly-snippets')                  " 色んな言語のsnippet集

call dein#add('MattesGroeger/vim-bookmarks')                   " 行にブックマークを設定してくれる
call dein#add('Shougo/context_filetype.vim')                   " 埋め込みのコードでカーソルからfiletypeを認識してくれる
call dein#add('bronson/vim-trailing-whitespace')               " 空白の削除
call dein#add('godlygeek/tabular')                             " 文字揃えをうまいことしてくれる
call dein#add('itchyny/vim-highlighturl')                      " URLのハイライトを行う
" call dein#add('kuuote/gina-preview.vim')                       " gina拡張
call dein#add('lambdalisue/suda.vim')                          " 読み書きをsuduでしてくれる
" call dein#add('lambdalisue/vim-findent')                       " fileから適切なインデントを読み取ってくれる
call dein#add('liuchengxu/vista.vim')                          " コードの変数やオブジェクト等を表示してくれる
call dein#add('markonm/traces.vim')                            " 置換結果を変換前に表示する
call dein#add('mattn/vim-findroot')                            " プロジェクトのルートを設定してくれる
"call dein#add('dhruvasagar/vim-table-mode',{'for':'markdown')} " markdownで上手い事テーブルを作れるモードを追加してくれる
"call dein#add('mattn/vim-maketable',{'for':'markdown')}        " セパレータからテーブルを作成してくれる
call dein#add('mg979/vim-visual-multi')                        " マルチカーソル
"call dein#add('plasticboy/vim-markdown', {'for':'markdown')}   " markdownのsyntax highlightを提供する
call dein#add('reireias/vim-cheatsheet')                       " 自分で設定したチートシートを表示する
call dein#add('simeji/winresizer')                             " windowのリサイズをおこなう
call dein#add('t9md/vim-quickhl')                              " 選択文字のハイライトをしてくれる
" call dein#add('thinca/vim-localrc')                            " ローカル設定のvimrcを読み込む
call dein#add('thinca/vim-qfreplace')                          " quick fixで置換を行う
call dein#add('thinca/vim-quickrun')                           " バッファのコードをシュッと実行してくれる
call dein#add('tyru/capture.vim')                              " Exコマンドをバッファに書きだしてくれる
call dein#add('norcalli/nvim-colorizer.lua')                   " colorcodeに色を付けてくれる
" call dein#add('mvllow/modes.nvim')                             " modeをカーソルの色でわかるようにする

call dein#add('glidenote/memolist.vim')                        " メモ取り用
call dein#add('andymass/vim-matchup')                          " 括弧をマッチさせる
call dein#add('cohama/lexima.vim')                             " 閉じカッコの補完をしてくれる
"call dein#add('windwp/nvim-autopairs')                         " leximaみたいなやつ
call dein#add('rhysd/clever-f.vim')                             "f移動を簡単にする(f移動後に;ではなくfで移動出来るようにする)
"call dein#add('SmiteshP/nvim-gps')                             " 現在の行の情報を表示してくれる
call dein#add('notomo/reacher.nvim')                           " 見えている範囲で検索する

call dein#add('voldikss/vim-translator')                       " 選択文字の翻訳をしてくれる

call dein#add('mattn/vim-goimports')              " Goでimportsとfmtを書き込み時に実行する
call dein#add('mattn/vim-goimpl')                 " interfaceを作成してくれる
call dein#add('mattn/vim-godoc')                  " godoc
call dein#add('mattn/vim-gomod')                  " modファイルのsyntax highlight
call dein#add('mattn/vim-goaddtags')              " tagを自動で付けてくれる
call dein#add('akinsho/flutter-tools.nvim')                    " flutterで開発出来るようにするプラグイン
call dein#add('previm/previm')                   " markdownをpreviewする
call dein#add('petertriho/nvim-scrollbar')                     " スクロールバーを表示する
call dein#add('kristijanhusak/line-notes.nvim')                " 行にノートを埋めこむ

"syntax
"call dein#add('rhysd/vim-gfm-syntax') "markdownをもっとハイライトする

"deno
if executable('deno')
     call dein#add('vim-denops/denops.vim')                     " denoのランタイム
     call dein#add('vim-skk/skkeleton')                         " deno版skk
     call dein#add('delphinus/skkeleton_indicator.nvim')        " skkeletonの状態を表示してくれる
     call dein#add('matsui54/denops-popup-preview.vim')         " 補完候補のプレビュー
     call dein#add('matsui54/denops-signature_help')            " signature help
     call dein#add('monaqa/dps-dial.vim')                       " インクリメント、デクリメント拡張
     call dein#add('lambdalisue/gin.vim')                       " git操作を出来るようにする

     "ddc
    "   call dein#add('Shougo/ddc.vim')
     call dein#add('Shougo/pum.vim')

    "   "source
    "   call dein#add('Shougo/ddc-around')
    "   call dein#add('LumaKernel/ddc-file')
    "   call dein#add('Shougo/ddc-nvim-lsp')
    "   call dein#add('shun/ddc-vim-lsp')
    "   call dein#add('Shougo/ddc-cmdline-history')
    "   call dein#add('Shougo/ddc-cmdline')
    "   call dein#add('Shougo/neco-vim')
    "   call dein#add('ippachi/ddc-yank')
    "   call dein#add('gamoutatsumi/ddc-emoji')

    "   "matcher
    "   call dein#add('Shougo/ddc-matcher_head')
    "   call dein#add('tani/ddc-fuzzy')
    "   call dein#add('takker99/ddc-bitap')

    "   "sorter
    "   call dein#add('Shougo/ddc-sorter_rank')

    "   "converter
    "   call dein#add('Shougo/ddc-converter_remove_overlap')

    "   "ddu
    "   call dein#add('Shougo/ddu.vim')
    "   call dein#add('Shougo/ddu-commands.vim')

    "   "ui
    "   call dein#add('Shougo/ddu-ui-ff')
    "   call dein#add('Shougo/ddu-ui-filer')

    "   "column
    "   call dein#add('Shougo/ddu-column-filename')
    "   call dein#add('ryota2357/ddu-column-icon_filename')

    "   "kind
    "   call dein#add('Shougo/ddu-kind-file')

    "   "source
    "   call dein#add('Shougo/ddu-source-file')
    "   call dein#add('Shougo/ddu-source-file_rec')
    "   call dein#add('Shougo/ddu-source-file_point')
    "   call dein#add('Shougo/ddu-source-register')
    "   call dein#add('shun/ddu-source-buffer')
    "   call dein#add('shun/ddu-source-rg')
    "   call dein#add('Shougo/ddu-source-line')
    "   call dein#add('matsui54/ddu-source-file_external')
    "   call dein#add('matsui54/ddu-source-command_history')
    "   call dein#add('lambdalisue/mr.vim')
    "   call dein#add('kuuote/ddu-source-mr')
    "   call dein#add('matsui54/ddu-source-help')
    "   call dein#add('4513ECHO/ddu-source-colorscheme')
    "   call dein#add('4513ECHO/ddu-source-source')

    "   "matcher
    "   call dein#add('Shougo/ddu-filter-matcher_substring')
    "   call dein#add('yuki-yano/ddu-filter-fzf')
    "   call dein#add('Shougo/ddu-filter-matcher_relative')
    "   call dein#add('Shougo/ddu-filter-matcher_hidden')
endif

"Filer
call dein#add('lambdalisue/fern.vim')
call dein#add('lambdalisue/nerdfont.vim')
call dein#add('lambdalisue/fern-renderer-nerdfont.vim')
call dein#add('lambdalisue/fern-git-status.vim')
call dein#add('lambdalisue/fern-mapping-project-top.vim')
call dein#add('lambdalisue/fern-hijack.vim')
call dein#add('lambdalisue/glyph-palette.vim')
call dein#add('yuki-yano/fern-preview.vim')

"Others
call dein#add('twitvim/twitvim')
call dein#add('xolox/vim-misc')
call dein#add('tyru/open-browser.vim')
call dein#add('ryanoasis/vim-devicons')
call dein#add('akinsho/toggleterm.nvim')
" call dein#add('voldikss/vim-floaterm')

"help
call dein#add('vim-jp/vimdoc-ja')

"operator
call dein#add('kana/vim-operator-user')
call dein#add('kana/vim-operator-replace')
call dein#add('machakann/vim-sandwich')

"text object
call dein#add('kana/vim-textobj-user')
call dein#add('glts/vim-textobj-comment')
call dein#add('kana/vim-textobj-entire')
call dein#add('kana/vim-textobj-function')
call dein#add('kana/vim-textobj-indent')
call dein#add('kana/vim-textobj-line')
call dein#add('machakann/vim-textobj-functioncall')
call dein#add('mattn/vim-textobj-url')
call dein#add('rhysd/vim-textobj-anyblock')
call dein#add('sgur/vim-textobj-parameter')
call dein#add('thinca/vim-textobj-between')

if has('win32') || has('win64')
    call dein#add('pprovost/vim-ps1') " PowerShellのFileTypeの追加等を行ってくれる
endif

" 未使用
" call dein#add('mfussenegger/nvim-dap')           "デバッガ
" call dein#add('Pocco81/DAPInstall.nvim')         "デバッガのインストール
" call dein#add('rcarriga/nvim-dap-ui')            "デバッガのUI拡張
" call dein#add('unblevable/quick-scope')          " fを押すとハイライトしてくれるようになる
"  call dein#add('AndrewRadev/linediff.vim')                      " 選択範囲のdiffを取ってくれる


" Required:
call dein#end()
