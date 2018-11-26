
MAIN="${ZDOTDIR}/main.zsh"
if [ -f "$MAIN" ];then
  source "$MAIN"
fi

ALIAS="${ZDOTDIR}/alias.zsh"
if [ -f "$ALIAS" ];then
  source "$ALIAS"
fi

PLUG="${ZDOTDIR}/plug.zsh"
if [ -f "$PLUG" ];then
  source "$PLUG"
fi

OPTION="${ZDOTDIR}/option.zsh"
if [ -f "$OPTION" ];then
  source "$OPTION"
fi

KEYBIND="${ZDOTDIR}/keybind.zsh"
if [ -f "$KEYBIND" ];then
  source "$KEYBIND"
fi

#初回シェル時のみ tmux実行
if [ $SHLVL = 1 ]; then
  tmux
fi

#Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
  [ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
      eval "$("$BASE16_SHELL/profile_helper.sh")"
