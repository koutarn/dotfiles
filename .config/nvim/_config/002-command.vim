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
command! EditVim :edit ~/.config/nvim/_config/
command! EditZsh :edit ~/.zsh/
command! EditTmux :edit ~/.tmux.conf
command! EditAlacritty :edit ~/.alacritty.yml
command! Root :edit ~/

command! Memo new | set filetype=markdown

"読み込み
if has('win32') || has('win64')
  command! Source source ~/_vimrc <bar> :nohl <bar> echomsg('Reload vimrc!!!')
elseif has('unix')
  command! Source source ~/.config/nvim/init.vim <bar> :nohl <bar> echomsg('Reload vimrc!!!')
endif
