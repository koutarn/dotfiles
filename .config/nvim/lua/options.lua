vim.cmd("autocmd!")
vim.scriptencoding = "utf-8"

-- [[ Setting options ]]
-- See `:help vim.opt`
local options = {
	encoding = "utf-8",
	fileencoding = "utf-8",

	-- テキスト
	number = true,
	relativenumber = false,
	ruler = true,

	-- 検索/置換
	hlsearch = false,
	ignorecase = true,
	smartcase = true,
	incsearch = true,
	wrapscan = true,

	-- When on, the ":substitute" flag 'g' is default on.
	gdefault = false,
	magic = true,

	title = false,
	backup = false,
	swapfile = false,

	-- コマンドラインは通常時は非表示にする
	cmdheight = 1,
	completeopt = { "menuone", "noselect" },
	conceallevel = 0,
	mouse = "a",
	pumheight = 10,
	showmode = false,
	smartindent = true,
	termguicolors = true,
	timeout = true,
	timeoutlen = 300,
	undofile = false,
	updatetime = 250,
	writebackup = false,
	shell = "zsh",
	backupskip = { "/tmp/*", "/private/tmp/*" },
	cursorline = true,

	numberwidth = 4,
	signcolumn = "yes",
	wrap = false,
	winblend = 0,
	wildoptions = "pum",
	pumblend = 5,
	background = "dark",
	scrolloff = 8,
	sidescrolloff = 8,
	guifont = "monospace:h17",
	splitbelow = true,
	splitright = true,
	breakindent = true,
	helplang = 'ja,en',
	hidden = true,
	autoread = true
}

vim.opt.clipboard:append{'unnamedplus'}
vim.opt.shortmess:append("c")

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- vim.o.startofline
-- vim.o.stal=0
-- vim.o.updatetime=300
-- vim.o.notitle
-- vim.o.showcmd
-- vim.o.nocursorline
-- vim.o.display=lastline
-- vim.o.laststatus=3
-- vim.o.nolist
-- vim.o.listchars=tab:\|\ ,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
-- vim.o.ambiwidth=single
-- vim.o.iminsert=0
-- vim.o.imsearch=-1
-- vim.o.inccommand=split

-- indent
-- vim.o.breakindent
-- vim.o.autoindent
-- vim.o.tm=500
-- vim.o.copyindent
-- vim.o.preserveindent
-- vim.o.backspace=indent,eol,start
-- " vim.o.smartindent

-- "折り返し
-- vim.o.wrap
-- vim.o.wrapmargin=0
--
-- vim.o.colorcolumn=0
-- vim.o.showmatch
-- vim.o.matchtime=1
-- vim.o.showbreak=>\ 
-- vim.o.wildmenu
-- vim.o.wildmode=list:longest,full
-- vim.o.matchpairs& matchpairs+=<:>
-- vim.o.infercase
-- vim.o.whichwrap=b,<,>,[,]
-- vim.o.scrolloff=40
-- vim.o.sidescrolloff=16
-- vim.o.sidescroll=1
-- vim.o.virtualedit=block
-- vim.o.nrformats=alpha,bin,hex
-- vim.o.confirm
-- vim.o.hidden
-- vim.o.noswapfile
-- vim.o.undolevels=1000"
-- vim.o.isfname-==
--
-- if !has('nvim')
--   vim.o.ttymouse=xterm2
-- endif
--
-- "terminal
-- vim.o.termguicolors
-- vim.o.t_ZH=
-- vim.o.t_ZR=
-- vim.o.t_Co=256
--
-- "thx https://github.com/kato-k/dotfiles/blob/5ea47516f3b9f5a425c827a1ebd859beb2ad4835/vimrc#L182
-- augroup vimrc_terminal
--   autocmd!
--   autocmd TermOpen * if &buftype == 'terminal' | silent! vim.o.nobuflisted | endif
-- augroup END
--
-- vim.o.nospell
-- vim.o.spelllang=en,cjk
-- vim.o.spelloptions=camel
-- vim.o.lazyredraw
-- vim.o.ttyfast
-- vim.o.ttimeoutlen=50
-- vim.o.shortmess+=I
-- vim.o.nofoldenable
-- vim.o.history=1000
