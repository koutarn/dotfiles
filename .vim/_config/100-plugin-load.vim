"================================
"vim plug settings
"===============================

call plug#begin()

Plug 'glepnir/indent-guides.nvim'
Plug 'phaazon/hop.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tversteeg/registers.nvim'

if has('win32') || has('win64')
  Plug 'hachibeeDI/vim-vbnet'
  Plug 'jeetsukumaran/vim-buffergator'
endif

"color scheme
Plug 'ghifarit53/tokyonight-vim'
Plug 'jaredgorski/spacecamp'

"Coding
Plug 'bronson/vim-trailing-whitespace'
Plug 'godlygeek/tabular'
Plug 'luochen1990/rainbow'
Plug 'tyru/capture.vim'
Plug 't9md/vim-quickhl'
Plug 'Townk/vim-autoclose'
Plug 'mg979/vim-visual-multi'
Plug 'scrooloose/nerdcommenter'
Plug 'simeji/winresizer'
Plug 'skanehira/preview-markdown.vim'
Plug 'plasticboy/vim-markdown'
Plug 'itchyny/lightline.vim'
Plug 'mattn/vim-findroot'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'thinca/vim-quickrun'
Plug 'tyru/eskk.vim'
Plug 'nvim-lua/popup.nvim'

"deno
" Plug 'vim-denops/denops.vim'
" Plug 'kuuote/dps-scrap'

"Filer
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'LumaKernel/fern-mapping-fzf.vim'
Plug 'mattn/vim-molder'
Plug 'moll/vim-bbye'

"Joke
Plug 'monaqa/vim-duzzle'

"Others
Plug 'twitvim/twitvim'
Plug 'xolox/vim-misc'
Plug 'tyru/open-browser.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
" Plug 'edluffy/specs.nvim'

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
