"================================
"vim plug settings
"===============================

call plug#begin()

"linux環境のみ
if has('unix')
  Plug 'b4b4r07/vim-shellutils'
endif

  Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Coding
Plug 'ghifarit53/tokyonight-vim'
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
Plug 'glepnir/indent-guides.nvim'
Plug 'itchyny/lightline.vim'
Plug 'mattn/vim-findroot'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'phaazon/hop.nvim'

"Filer
Plug 'lambdalisue/fern.vim'
Plug 'mattn/vim-molder'
Plug 'romgrk/barbar.nvim'
Plug 'moll/vim-bbye'

"Joke
Plug 'monaqa/vim-duzzle'

"Others
Plug 'twitvim/twitvim'
Plug 'vim-jp/vimdoc-ja'
Plug 'xolox/vim-misc'
Plug 'kyazdani42/nvim-web-devicons'
" Plug 'numtostr/FTerm.nvim'

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
