-- =================================
-- b3nj5m1n/kommentary
-- ==================================

require('kommentary.config').configure_language('default', {
    prefer_single_line_comments = true,
})

require('kommentary.config').configure_language('c', {
    single_line_comment_strings = {'/*', '*/'},
    multi_line_comment_strings = {'/*', '*/'},
})

require('kommentary.config').configure_language('cpp', {
    single_line_comment_strings = {'/*', '*/'},
    multi_line_comment_strings = {'/*', '*/'},
})

require('kommentary.config').configure_language('lua', {
    hook_function = function()
    require('ts_context_commentstring.internal').update_commentstring()
end,
})

vim.api.nvim_set_keymap('n', '<Leader>cc', '<Plug>kommentary_line_default', {})
vim.api.nvim_set_keymap('n', '<Leader>c', '<Plug>kommentary_motion_default', {})
vim.api.nvim_set_keymap('v', '<Leader>c', '<Plug>kommentary_visual_default', {})
