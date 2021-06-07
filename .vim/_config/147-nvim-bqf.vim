UsePlugin 'nvim-bqf'
"==================================
"kevinhwang91/nvim-bqf
"==================================
lua << EOF
require('bqf').setup({
  auto_enable = true,
  preview = {
    win_height = 25,
    win_vheight = 25,
  },

  func_map = {
    open = '',
    openc = '',
    vsplit = 'o',
    split = 'O',
    pscrollup = '<C-k>',
    pscrolldown = '<C-j>'
  },
 })
EOF
