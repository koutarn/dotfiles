"================================
"vim plug settings
"===============================

call plug#begin()

if has('nvim')
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-lua/popup.nvim'
    Plug 'Pocco81/DAPInstall.nvim'
    Plug 'b3nj5m1n/kommentary'
    Plug 'folke/todo-comments.nvim'
    Plug 'folke/which-key.nvim'
    Plug 'glepnir/indent-guides.nvim'
    Plug 'kevinhwang91/nvim-bqf'
    Plug 'kevinhwang91/nvim-hlslens'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'mfussenegger/nvim-dap'
    Plug 'monaqa/dial.nvim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'rcarriga/nvim-dap-ui'
    Plug 'romgrk/barbar.nvim'
    Plug 'tversteeg/registers.nvim'

    if executable('rg') && executable('sed')
        Plug 'windwp/nvim-spectre'
    endif

    "treesitter依存
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'code-biscuits/nvim-biscuits'
    Plug 'p00f/nvim-ts-rainbow'
    Plug 'winston0410/smart-cursor.nvim'
    Plug 'JoosepAlviste/nvim-ts-context-commentstring'
endif

 if has('win32') || has('win64')
    Plug 'hachibeeDI/vim-vbnet'
 endif

    "color scheme
    " Plug 'ful1e5/onedark.nvim'
    Plug 'sainnhe/edge'

"Coding
Plug 'MattesGroeger/vim-bookmarks'
Plug 'Shougo/context_filetype.vim'
Plug 'aiya000/aho-bakaup.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'cohama/lexima.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'godlygeek/tabular'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-highlighturl'
Plug 'junegunn/fzf'
Plug 'lambdalisue/gina.vim'
Plug 'lambdalisue/suda.vim'
Plug 'lambdalisue/vim-findent'
Plug 'liuchengxu/vista.vim'
Plug 'markonm/traces.vim'
Plug 'mattn/vim-findroot'
Plug 'mattn/vim-maketable'
Plug 'mg979/vim-visual-multi'
Plug 'obcat/vim-ipos'
Plug 'plasticboy/vim-markdown'
Plug 'reireias/vim-cheatsheet'
Plug 'simeji/winresizer'
Plug 'skanehira/preview-markdown.vim'
Plug 'skanehira/translate.vim'
Plug 't9md/vim-quickhl'
" Plug 'thinca/vim-ambicmd'
Plug 'thinca/vim-localrc'
Plug 'thinca/vim-qfreplace'
Plug 'thinca/vim-quickrun'
Plug 'tyru/capture.vim'
Plug 'tyru/eskk.vim'
Plug 'kuuote/gina-preview.vim'

"syntax
Plug 'rhysd/vim-gfm-syntax'
Plug 'mboughaba/i3config.vim'

"deno
if executable('deno')
    " Plug 'vim-denops/denops.vim'
    " Plug 'skanehira/command.vim'
    " Plug 'kuuote/dps-scrap'
endif

"Filer
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/fern-mapping-project-top.vim'
Plug 'lambdalisue/fern-hijack.vim'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'LumaKernel/fern-mapping-fzf.vim'
Plug 'yuki-yano/fern-preview.vim'

"Joke
Plug 'monaqa/vim-duzzle'

"Others
Plug 'twitvim/twitvim'
Plug 'xolox/vim-misc'
Plug 'tyru/open-browser.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'voldikss/vim-floaterm'

"help見る用
Plug 'vim-jp/vimdoc-ja'

"operator
Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-replace'
Plug 'machakann/vim-sandwich'

"text object
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'machakann/vim-textobj-functioncall'
Plug 'mattn/vim-textobj-url'
Plug 'rhysd/vim-textobj-anyblock'
Plug 'sgur/vim-textobj-parameter'
Plug 'thinca/vim-textobj-between'

"kouratn
Plug 'LeafCage/vimhelpgenerator'
Plug 'mopp/layoutplugin.vim'
Plug 'koutarn/HelloWorld.vim'

" Plug ('~/Projects/koutarn/dasen-kunda.vim')
" Plug ('~/Projects/koutarn/vim-operator-saihenkan')

call plug#end()

let s:plugs = get(s:, 'plugs', get(g:, 'plugs', {}))
function! FindPlugin(name) abort
    return has_key(s:plugs, a:name) ? isdirectory(s:plugs[a:name].dir) : 0
endfunction
command! -nargs=1 UsePlugin if !FindPlugin(<args>) | finish | endif
