UsePlugin 'smart-cursor.nvim'
"==================================
"'winston0410/smart-cursor.nvim'
"==================================

lua << EOF
vim.api.nvim_set_keymap('n', 'o',
'o<cmd>lua require("smart-cursor").indent_cursor()<cr>',
{silent = true, noremap = true})
EOF
