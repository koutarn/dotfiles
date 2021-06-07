UsePlugin 'nvim-dap'
"==================================
"mfussenegger/nvim-dap
"==================================

lua<<EOF
local dap = require 'dap'
dap.adapters.c = {
  type = 'executable',
  attach = {
    pidProperty = "pid",
    pidSelect = "ask"
  },
  command = 'lldb-vscode',
  env = {
    LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES"
  },
  name = "lldb"
}



vim.fn.sign_define('DapBreakpoint', {text = '🛑', texthl = '', linehl = '', numhl = ''})
vim.api.nvim_set_keymap('n', '<leader>db', "<Cmd>lua require'dap'.toggle_breakpoint()<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>dc', "<Cmd>lua require'dap'.continue()<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>dn', "<Cmd>lua require'dap'.step_over()<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>di', "<Cmd>lua require'dap'.step_into()<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>do', "<Cmd>lua require'dap'.step_out()<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>dR', "<Cmd>lua require'dap'.repl.open()<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>dB',
                        "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>dl', "<Cmd>lua require'dap'.load_launchjs()<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>dg', "<Cmd>lua require'dap'.run()<CR>",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>dG', "<Cmd>lua require'dap'.run_last()<CR>",
                        {noremap = true, silent = true})
EOF
