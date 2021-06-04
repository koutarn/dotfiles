UsePlugin 'nvim-ts-context-commentstring'
"==================================
"JoosepAlviste/nvim-ts-context-commentstring
"==================================
lua<<EOF
require'nvim-treesitter.configs'.setup {
  context_commentstring = {
    enable = true
  }
}
EOF
