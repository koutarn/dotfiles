UsePlugin 'nvim-treesitter'
"==================================
"nvim-treesitter/nvim-treesitter
"==================================

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
      enable = true,  -- syntax highlightを有効にする
  }
}
require 'nvim-treesitter.install'.compilers = { "gcc","clang"}
EOF
