
" Auto mkdir
" https://vim-jp.org/vim-users-jp/2011/02/20/Hack-202.html
augroup vimrc-auto-mkdir
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)
    if !isdirectory(a:dir) && (a:force ||
    \    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction
augroup END

"動作検証
"thx https://github.com/kato-k/vim-tips/blob/main/articles/vim-tips-no004.md
command! OpenProfile :edit ~/.cache/nvim/profile.txt
command! Profile call s:command_profile()
function! s:command_profile() abort
  profile start ~/.cache/nvim/profile.txt
  profile func *
  profile file *
endfunction
