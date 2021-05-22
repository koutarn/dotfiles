UsePlugin 'nvim-biscuits'
"===========================
"code-biscuits/nvim-biscuits
"============================

lua <<EOF
require('nvim-biscuits').setup({
  default_config = {
    max_length = 10,
    min_distance = 7,
    prefix_string = "=> ",
  },
  language_config = {
    python = {
      disabled = true
    }
  }
})
EOF

augroup vimrc_biscuits
  autocmd VimEnter,ColorScheme * highlight BiscuitColor ctermfg=grey guifg=grey
augroup END
