-- https://github.com/rebelot/kanagawa.nvim
require('kanagawa').setup({
    undercurl = true,
    commentStyle = "NONE",
    functionStyle = "bold",
    keywordStyle = "NONE",
    statementStyle = "NONE",
    typeStyle = "NONE",
    variablebuiltinStyle = "NONE",
    specialReturn = true,       -- special highlight for the return keyword
    specialException = true,    -- special highlight for exception handling keywords
    transparent = false,        -- do not set background color
    dimInactive = false,        -- dim inactive window `:h hl-NormalNC`
    globalStatus = true,       -- adjust window separators highlight for laststatus=3
    colors = {
        -- Dark background (statuslines and floating windows)
        sumiInk0 = '#2c2c3a',

        waveBlue1   = '#223249', -- Popup background, visual selection background
        waveBlue2   = '#672d4f', -- Popup selection background, search background

	    fujiWhite   = '#DCD7BA', -- Default foreground
        oldWhite    = 'white',   -- Dark foreground (statuslines)
        sumiInk2    = '#2A2A37', -- Lighter background (colorcolumn, folds)
        sumiInk3    = '#363646', -- Lighter background (cursorline)
        sumiInk4    = '#54546D', -- Darker foreground (line numbers, fold column, non-text characters), float borders

        oniViolet   = '#baacd1', -- Statements and Keywords
        crystalBlue = '#7E9CD8', -- Functions and Titles

    },
    overrides = {},
})

vim.cmd("colorscheme kanagawa")

