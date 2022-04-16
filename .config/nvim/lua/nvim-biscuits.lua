--[[ require('nvim-biscuits').setup({
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

-- 文字色を変更
augroup vimrc_biscuits
  autocmd!
  autocmd VimEnter,ColorScheme * highlight BiscuitColor ctermfg=grey guifg=grey
augroup END ]]
