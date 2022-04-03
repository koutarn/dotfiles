"================================
"Jetpack settings
"===============================

"fast install and starupt
let g:jetpack#optimization=2

call jetpack#begin()

if has('nvim')
" Jetpack'nvim-lua/plenary.nvim'
" Jetpack'nvim-lua/popup.nvim'
Jetpack'b3nj5m1n/kommentary'
Jetpack'folke/todo-comments.nvim'
Jetpack'folke/which-key.nvim'
Jetpack'glepnir/indent-guides.nvim'
Jetpack'kevinhwang91/nvim-bqf'
Jetpack'kevinhwang91/nvim-hlslens'
Jetpack'kyazdani42/nvim-web-devicons'
Jetpack'mfussenegger/nvim-dap'
Jetpack'Pocco81/DAPInstall.nvim'
Jetpack'monaqa/dial.nvim'
" Jetpack'rcarriga/nvim-dap-ui'
Jetpack'romgrk/barbar.nvim'
Jetpack'tversteeg/registers.nvim'
"Jetpack'gelguy/wilder.nvim', { 'do': ':UpdateRemoteJetPackins' }

if executable('rg') && executable('sed')
" Jetpack'windwp/nvim-spectre'
endif

"treesitter依存
Jetpack'nvim-treesitter/nvim-treesitter'
Jetpack'code-biscuits/nvim-biscuits'
Jetpack'p00f/nvim-ts-rainbow'
Jetpack'winston0410/smart-cursor.nvim'
Jetpack'JoosepAlviste/nvim-ts-context-commentstring'
endif

 if has('win32') || has('win64')
    Jetpack'hachibeeDI/vim-vbnet'
 endif

"color scheme
" Jetpack'ful1e5/onedark.nvim'
Jetpack'sainnhe/edge'

"Coding
Jetpack'prabirshrestha/vim-lsp'
Jetpack'mattn/vim-lsp-settings'

Jetpack'MattesGroeger/vim-bookmarks'
Jetpack'Shougo/context_filetype.vim'
" Jetpack'aiya000/aho-bakaup.vim'
Jetpack'bronson/vim-trailing-whitespace'
Jetpack'cohama/lexima.vim'
Jetpack'dhruvasagar/vim-table-mode'
Jetpack'godlygeek/tabular'
Jetpack'itchyny/lightline.vim'
Jetpack'itchyny/vim-highlighturl'
Jetpack'junegunn/fzf'
Jetpack'lambdalisue/gina.vim'
Jetpack'lambdalisue/suda.vim'
Jetpack'lambdalisue/vim-findent'
Jetpack'liuchengxu/vista.vim'
Jetpack'markonm/traces.vim'
Jetpack'mattn/vim-findroot'
Jetpack'mattn/vim-maketable'
Jetpack'mg979/vim-visual-multi'
Jetpack'obcat/vim-ipos'
Jetpack'plasticboy/vim-markdown', {'for':'markdown'}
Jetpack'reireias/vim-cheatsheet'
Jetpack'simeji/winresizer'
Jetpack'skanehira/preview-markdown.vim', {'for':'markdown'}
Jetpack'skanehira/translate.vim'
Jetpack't9md/vim-quickhl'
Jetpack'thinca/vim-localrc'
Jetpack'thinca/vim-qfreplace'
Jetpack'thinca/vim-quickrun'
Jetpack'tyru/capture.vim'
" Jetpack'tyru/eskk.vim'
Jetpack'kuuote/gina-preview.vim'

"syntax
Jetpack'rhysd/vim-gfm-syntax', {'for':'markdown'} "markdownをもっとハイライトする
" Jetpack'mboughaba/i3config.vim'

"deno
if executable('deno')
Jetpack'vim-denops/denops.vim'
" Jetpack'vim-denops/denops-helloworld.vim'
" Jetpack'skanehira/command.vim'
Jetpack'vim-skk/skkeleton'
Jetpack'delphinus/skkeleton_indicator.nvim'

"ddc
Jetpack'Shougo/ddc.vim'
Jetpack'Shougo/pum.vim'

"source
Jetpack'Shougo/ddc-around'
Jetpack'LumaKernel/ddc-file'
Jetpack'shun/ddc-vim-lsp'
Jetpack'Shougo/ddc-cmdline-history'
Jetpack'Shougo/ddc-cmdline'
Jetpack'Shougo/neco-vim'
Jetpack'ippachi/ddc-yank'

"matcher
Jetpack'Shougo/ddc-matcher_head'
Jetpack'matsui54/ddc-matcher_fuzzy'
Jetpack'tani/ddc-fuzzy'

"sorter
Jetpack'Shougo/ddc-sorter_rank'

"converter
Jetpack'Shougo/ddc-converter_remove_overlap'

"ddu
Jetpack'Shougo/ddu.vim'
Jetpack'Shougo/ddu-ui-ff'
Jetpack'Shougo/ddu-commands.vim'

"ui

"kind
Jetpack'Shougo/ddu-kind-file'

"source
Jetpack'Shougo/ddu-source-file'
Jetpack'Shougo/ddu-source-file_rec'
Jetpack'Shougo/ddu-source-register'
Jetpack'shun/ddu-source-buffer'
Jetpack'shun/ddu-source-rg'

"matcher
Jetpack'Shougo/ddu-filter-matcher_substring'
Jetpack'yuki-yano/ddu-filter-fzf'
endif

"Filer
Jetpack'lambdalisue/fern.vim'
Jetpack'lambdalisue/nerdfont.vim'
Jetpack'lambdalisue/fern-renderer-nerdfont.vim'
Jetpack'lambdalisue/fern-git-status.vim'
Jetpack'lambdalisue/fern-mapping-project-top.vim'
Jetpack'lambdalisue/fern-hijack.vim'
Jetpack'lambdalisue/glyph-palette.vim'
Jetpack'LumaKernel/fern-mapping-fzf.vim'
Jetpack'yuki-yano/fern-preview.vim'

"Joke
"Jetpack'monaqa/vim-duzzle'

"Others
Jetpack'twitvim/twitvim'
Jetpack'xolox/vim-misc'
Jetpack'tyru/open-browser.vim'
Jetpack'ryanoasis/vim-devicons'
Jetpack'voldikss/vim-floaterm'

"help
Jetpack'vim-jp/vimdoc-ja'

"operator
Jetpack'kana/vim-operator-user'
Jetpack'kana/vim-operator-replace'
Jetpack'machakann/vim-sandwich'

"text object
Jetpack'glts/vim-textobj-comment'
Jetpack'kana/vim-textobj-entire'
Jetpack'kana/vim-textobj-function'
Jetpack'kana/vim-textobj-indent'
Jetpack'kana/vim-textobj-line'
Jetpack'kana/vim-textobj-user'
Jetpack'machakann/vim-textobj-functioncall'
Jetpack'mattn/vim-textobj-url'
Jetpack'rhysd/vim-textobj-anyblock'
Jetpack'sgur/vim-textobj-parameter'
Jetpack'thinca/vim-textobj-between'

call jetpack#end()

let data_dir = has('nvim') ? stdpath('config') : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/tani/vim-plug/master/autoload/plug.vim'
  autocmd VimEnter * JetpackSync | source $MYVIMRC
endi

command! -nargs=1 UsePlugin if !jetpack#tap(<args>) | finish | endif
