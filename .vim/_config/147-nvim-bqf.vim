UsePlugin 'nvim-bqf'
"==================================
"kevinhwang91/nvim-bqf
"==================================
lua << EOF
require('bqf').setup({
  func_map = {pscrollup = '<C-k>', pscrolldown = '<C-j>'}
 })
EOF
