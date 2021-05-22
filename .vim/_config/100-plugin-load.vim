"================================
"vim plug settings
"===============================

call plug#begin()

if has('nvim')
  Plug 'glepnir/indent-guides.nvim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'tversteeg/registers.nvim'
  Plug 'nvim-lua/popup.nvim'
  " Plug 'phaazon/hop.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  " Plug 'edluffy/specs.nvim'

  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'code-biscuits/nvim-biscuits'
  Plug 'p00f/nvim-ts-rainbow'
  Plug 'romgrk/barbar.nvim'
endif

 if has('win32') || has('win64')
   Plug 'hachibeeDI/vim-vbnet'
   " Plug 'jeetsukumaran/vim-buffergator'
 endif


 "color scheme
 Plug 'joshdick/onedark.vim'

 " Plug 'ghifarit53/tokyonight-vim'

 " "Coding
 Plug 'Shougo/context_filetype.vim'
 Plug 'bronson/vim-trailing-whitespace'
 Plug 'godlygeek/tabular'
 Plug 'tyru/capture.vim'
 Plug 't9md/vim-quickhl'
 " Plug 'Townk/vim-autoclose'
 Plug 'cohama/lexima.vim'
 Plug 'mg979/vim-visual-multi'
 Plug 'scrooloose/nerdcommenter'
 Plug 'simeji/winresizer'
 Plug 'skanehira/preview-markdown.vim'
 Plug 'plasticboy/vim-markdown'
 Plug 'mattn/vim-findroot'
 Plug 'MattesGroeger/vim-bookmarks'
 Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
 Plug 'thinca/vim-quickrun'
 Plug 'tyru/eskk.vim'
 Plug 'itchyny/lightline.vim'
 " Plug 'itchyny/vim-cursorword'
 Plug 'itchyny/vim-highlighturl'
 Plug 'lambdalisue/gina.vim'
 Plug 'thinca/vim-ambicmd'
"
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
Plug 'lambdalisue/glyph-palette.vim'
" Plug 'mattn/vim-molder'
" Plug 'mattn/vim-molder-operations'

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
Plug 'notomo/helpeek.vim'

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
Plug 'deton/textobj-nonblankchars.vim'

call plug#end()

let s:plugs = get(s:, 'plugs', get(g:, 'plugs', {}))
function! FindPlugin(name) abort
  return has_key(s:plugs, a:name) ? isdirectory(s:plugs[a:name].dir) : 0
endfunction
command! -nargs=1 UsePlugin if !FindPlugin(<args>) | finish | endif
