UsePlugin 'nvim-biscuits'
"===========================
"code-biscuits/nvim-biscuits
"============================


lua <<EOF
require('nvim-biscuits').setup({
  default_config = {
    max_length = 12,
    min_distance = 5,
    prefix_string = '📎 ',
  },
  language_config = {
    python = {
      disabled = true
    }
  }
})
EOF

augroup vimrc_biscuits
  autocmd!
  autocmd VimEnter,ColorScheme * highlight BiscuitColor ctermfg=grey guifg=grey
augroup END
