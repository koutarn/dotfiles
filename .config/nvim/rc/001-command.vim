"文字コード絡み
"thx https://github.com/tsuyoshicho/vimrc-reading/blob/7451171f07e88d6d1dcd73deb792aff115d2c94e/.vimrc
command! Utf8  edit ++encoding=utf-8 %
command! Cp932 edit ++encoding=cp932 %
command! Unix  edit ++fileformat=unix   %
command! Dos   edit ++fileformat=dos    %
command! AsUtf8 setlocal fileencoding=utf-8 | w
command! AsDos  setlocal fileformat=dos     | w
command! AsUnix setlocal fileformat=unix    | w

"edit dotfile
command! EditVim :edit ~/.config/nvim/rc/
command! EditZsh :edit ~/.zsh/
command! EditTmux :edit ~/.tmux.conf
command! EditAlacritty :edit ~/.alacritty.yml
command! Root :edit ~/

command! Memo new | set filetype=markdown

"読み込み
command! Source source ~/.config/nvim/init.vim <bar> :nohl <bar> echomsg('Reload vimrc!!!')

"今開いているファイルをリネーム
"thx https://github.com/monaqa/dotfiles/blob/424b0ab2d7623005f4b79544570b0f07a76e921a/.config/nvim/scripts/command.vim#L50-L58
command! -nargs=1 RenameMe call RenameMe(<q-args>)
function! RenameMe(newFileName)
  let currentFileName = expand('%')
  execute 'saveas ' . a:newFileName
  bdelete! #
  call delete(currentFileName)
endfunction
cnoreabbrev <expr> RenameMe "RenameMe " . expand('%')

function! s:cd_repo(shell, repo) abort
    execute 'lcd' trim(system('ghq root')) .. '/' .. a:repo
" call s:open_terminal('new', '', a:shell)
" exe 'wincmd k'
endfunction
