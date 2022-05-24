-- https://github.com/rebelot/kanagawa.nvim
require('kanagawa').setup({
    undercurl = true,
    commentStyle = "NONE",
    functionStyle = "bold",
    keywordStyle = "NONE",
    statementStyle = "bold",
    typeStyle = "bold",
    variablebuiltinStyle = "NONE",
    specialReturn = true,       -- special highlight for the return keyword
    specialException = true,    -- special highlight for exception handling keywords
    transparent = false,        -- do not set background color
    dimInactive = false,        -- dim inactive window `:h hl-NormalNC`
    globalStatus = true,       -- adjust window separators highlight for laststatus=3
    colors = {
        -- Default background
        sumiInk1 = "#282C34", -- one darkが好きなので入れかえる

        -- Dark background (statuslines and floating windows)
        sumiInk0 = '#223249',

        waveBlue1    = '#223249',     -- Popup background, visual selection background
        waveBlue2    = '#2D4F67',     -- Popup selection background, search background

	    fujiWhite    = '#DCD7BA',     -- Default foreground
        oldWhite     = '#C8C093',     -- Dark foreground (statuslines)
        sumiInk2     = '#2A2A37',     -- Lighter background (colorcolumn, folds)
        sumiInk3     = '#363646',     -- Lighter background (cursorline)
        sumiInk4     = '#54546D',     -- Darker foreground (line numbers, fold column, non-text characters), float borders
        winterGreen  = '#2B3328',     -- Diff Add (background)
        winterYellow = '#49443C',     -- Diff Change (background)
        winterRed    = '#43242B',     -- Diff Deleted (background)
        winterBlue   = '#252535',     -- Diff Line (background)


    },
    overrides = {},
})

vim.cmd("colorscheme kanagawa")

