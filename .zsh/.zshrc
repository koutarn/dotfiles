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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -r /home/ez/.opam/opam-init/init.zsh && . /home/ez/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

export LESSCHARSET=utf-8

# zoxide
eval "$(zoxide init zsh)"
