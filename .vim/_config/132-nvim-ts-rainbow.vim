UsePlugin 'nvim-ts-rainbow'
"=====================
"p00f/nvim-ts-rainbow
"=====================

lua <<EOF
require'nvim-treesitter.configs'.setup {
  rainbow = {
    enable = true,
    extended_mode = false,
    max_file_lines = 5000,
  }
}
EOF

