UsePlugin 'onedark.nvim'
"================================
" Plug 'ful1e5/onedark.nvim'
"================================

lua<<EOF
require("onedark").setup({
    commentStyle = "NONE",
    keywordStyle = "NONE",
    functionStyle = "bold",
    variableStyle = "NONE",
    sidebars = {"fern", "vista_kind"},
    darkSidebar = true,
    darkFloat = true,
})
EOF
