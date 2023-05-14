-- [[ Setting options ]]
-- See `:help vim.opt`

-- encoding
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- show line numbers bad not relative
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.ruler = true

vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.o.wrapmargin=0
vim.opt.pumblend = 5 -- pseudo-transparency for popup-menu
vim.opt.cursorline = false
vim.opt.cursorcolumn   = false

-- インデント
vim.opt.smartindent = true
vim.opt.breakindent = true

-- window
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.o.splitkeep = "cursor"
vim.o.equalalways = false -- windowの自動調整をしない

-- 描画系
-- nvim color
vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1
vim.o.synmaxcolsynmaxcol = 200
vim.cmd.syntax("enable")
vim.o.background = "dark"

-- true color support
if vim.fn.exists("+termguicolors") == 1 then
        -- vim.o.t_8f = "<Esc>[38;2;%lu;%lu;%lum"
        -- vim.o.t_8b = "<Esc>[48;2;%lu;%lu;%lum"
        vim.o.termguicolors = true
end
-- Set 256 color
vim.o.t_Co = 256

-- highlight Comment cterm = italic gui = italic
vim.o.t_ZH = '^[[3m'
vim.o.t_ZR = '^[[23m'
vim.opt.lazyredraw = true
vim.opt.ttyfast = true
vim.opt.showmatch = false
vim.opt.showcmd = false
vim.o.display = "lastline" -- long lines fit on one line

-- 検索/置換
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.wrapscan = true
vim.opt.gdefault = false
vim.opt.magic = true

-- file
vim.opt.title = false
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.autoread = true
vim.opt.helplang = {'ja','en'}
vim.o.spell = false
vim.o.laststatus = 3
vim.o.undolevels = 1000
vim.o.formatoptions = vim.o.formatoptions .. "m" -- Add formatting options, multi-byte system

-- cmd
vim.opt.cmdheight = 0
vim.opt.completeopt = { "menuone","noselect" }
vim.opt.wildoptions = "pum"
vim.o.history = 10000 -- numbers of entries in history for ':' commands and search patterns (10000 = max)
vim.o.wildmenu = true -- Enhanced command completion
vim.o.wildmode = "longest,list,full"

-- mouse
vim.opt.mouse = "a"

-- メッセージ表示
vim.opt.shortmess:append{ s = true, I = true}
vim.o.confirm = true -- Prompt for options when the buffer is unread for unsafe operations
vim.opt.conceallevel = 0
vim.opt.pumheight = 10

-- GUI font
vim.opt.guifont = "monospace:h17"

-- Terminal
vim.o.shellslash = true -- Enable / as a directory path separator in Windows

-- mode表示
vim.opt.showmode = false
vim.opt.timeout = true
vim.opt.timeoutlen = 300
vim.opt.undofile = false
vim.opt.updatetime = 250
vim.opt.writebackup = false
vim.opt.numberwidth = 4
vim.opt.winblend = 0
vim.o.startofline = false
vim.opt.scrolloff = 40
vim.opt.sidescrolloff = 16

-- Allow switching of unsaved buffers
vim.opt.hidden = true

-- No sound on errors
vim.o.belloff = 'all'

vim.opt.clipboard:append{'unnamedplus'}
vim.o.list = true
vim.opt.listchars = {tab='»-', trail='-', eol='↲', extends='»', precedes='«', nbsp='%'}

-- TODO:場合分けする
vim.opt.shell = "pwsh"
vim.o.inccommand=split

-- singleにしないとバグるので
vim.o.ambiwidth = 'single'
vim.o.backspace = "indent,eol,start"

-- 入力待ち時間
vim.o.ttimeoutlen=10

-- Fold
vim.o.foldmethod = "manual"
vim.o.foldlevel = 1
vim.o.foldlevelstart = 99
vim.w.foldcolumn = "0:"
