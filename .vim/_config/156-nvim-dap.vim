UsePlugin 'nvim-dap'
"==================================
"mfussenegger/nvim-dap
"==================================

lua<<EOF
local dap = require('dap')
dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode', -- adjust as needed
  name = "lldb"
}

local dap = require('dap')
dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
    runInTerminal = true,
  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp



vim.fn.sign_define('DapBreakpoint', {text = '🛑', texthl = '', linehl = '', numhl = ''})
vim.api.nvim_set_keymap('n', '<Leader>d<ESC>', "<Cmd>lua require'dap'.stop()<CR>",{noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>db', "<Cmd>lua require'dap'.toggle_breakpoint()<CR>",{noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>dc', "<Cmd>lua require'dap'.continue()<CR>",{noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>dn', "<Cmd>lua require'dap'.step_over()<CR>",{noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>di', "<Cmd>lua require'dap'.step_into()<CR>",{noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>do', "<Cmd>lua require'dap'.step_out()<CR>",{noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>dR', "<Cmd>lua require'dap'.repl.open()<CR>",{noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>dB', "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",{noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>dl', "<Cmd>lua require'dap'.load_launchjs()<CR>",{noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>dg', "<Cmd>lua require'dap'.run()<CR>",{noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>dG', "<Cmd>lua require'dap'.run_last()<CR>",{noremap = true, silent = true})
EOF
