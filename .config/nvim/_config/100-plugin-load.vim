"================================
"vim plug settings
"===============================

call plug#begin()

if has('nvim')
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'glepnir/indent-guides.nvim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'tversteeg/registers.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'kevinhwang91/nvim-hlslens'
  Plug 'romgrk/barbar.nvim'
  Plug 'folke/which-key.nvim'
  Plug 'monaqa/dial.nvim'
  Plug 'b3nj5m1n/kommentary'
  Plug 'folke/todo-comments.nvim'
  Plug 'kevinhwang91/nvim-bqf'
  Plug 'mfussenegger/nvim-dap'
  Plug 'Pocco81/DAPInstall.nvim'
  Plug 'rcarriga/nvim-dap-ui'

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
Plug 'joshdick/onedark.vim'

"Coding
Plug 'Shougo/context_filetype.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'godlygeek/tabular'
Plug 'tyru/capture.vim'
Plug 't9md/vim-quickhl'
Plug 'cohama/lexima.vim'
Plug 'mg979/vim-visual-multi'
Plug 'simeji/winresizer'
Plug 'skanehira/preview-markdown.vim'
Plug 'plasticboy/vim-markdown'
Plug 'mattn/vim-findroot'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'junegunn/fzf'
Plug 'thinca/vim-quickrun'
Plug 'tyru/eskk.vim'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-highlighturl'
Plug 'lambdalisue/gina.vim'
Plug 'thinca/vim-ambicmd'
Plug 'thinca/vim-qfreplace'
Plug 'lambdalisue/vim-findent'
Plug 'lambdalisue/suda.vim'
Plug 'mattn/vim-maketable'
Plug 'dhruvasagar/vim-table-mode'
Plug 'skanehira/translate.vim'
Plug 'thinca/vim-localrc'
Plug 'liuchengxu/vista.vim'
Plug 'reireias/vim-cheatsheet'
Plug 'aiya000/aho-bakaup.vim'
Plug 'obcat/vim-ipos'
Plug 'osyo-manga/vim-precious'

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
Plug 'LumaKernel/fern-mapping-fzf.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/fern-mapping-project-top.vim'
Plug 'lambdalisue/fern-hijack.vim'
Plug 'yuki-yano/fern-preview.vim'
Plug 'lambdalisue/glyph-palette.vim'

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
Plug 'kana/vim-textobj-user'
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'rhysd/vim-textobj-anyblock'
Plug 'thinca/vim-textobj-between'
Plug 'mattn/vim-textobj-url'
Plug 'sgur/vim-textobj-parameter'

call plug#end()

let s:plugs = get(s:, 'plugs', get(g:, 'plugs', {}))
function! FindPlugin(name) abort
  return has_key(s:plugs, a:name) ? isdirectory(s:plugs[a:name].dir) : 0
endfunction
command! -nargs=1 UsePlugin if !FindPlugin(<args>) | finish | endif
