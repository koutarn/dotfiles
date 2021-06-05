UsePlugin 'kommentary'
"==================================
"b3nj5m1n/kommentary
"==================================
lua << EOF
require('kommentary.config').configure_language('c', {
    prefer_single_line_comments = false,
    prefer_multi_line_comments = true,
    multi_line_comment_strings = {'/*', '*/'},
})

require('kommentary.config').configure_language('cpp', {
    prefer_single_line_comments = false,
    prefer_multi_line_comments = true,
    multi_line_comment_strings = {'/*', '*/'},
})

vim.api.nvim_set_keymap('n', '<leader>cc', '<Plug>kommentary_line_default', {})
vim.api.nvim_set_keymap('n', '<leader>c', '<Plug>kommentary_motion_default', {})
vim.api.nvim_set_keymap('v', '<leader>c', '<Plug>kommentary_visual_default', {})
EOF
