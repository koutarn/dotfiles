<<<<<<< HEAD
export ZDOTDIR="${HOME}/.zsh"
autoload -U compinit
compinit -u

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

<<<<<<<< HEAD:home/.zshrc
ENV="${ZDOTDIR}/ENV.zsh"
if [ -f "$ENV" ];then
  source "$ENV"
fi
|||||||| f6ba3af:home/.zsh/.zshrc

#初回シェル時のみ tmux実行
if [ $SHLVL = 1 ]; then
  tmux
fi
========

#初回シェル時のみ tmux実行
#if [ $SHLVL = 1 ]; then
#  tmux
#fi

>>>>>>>> 56d7da0268eb94e950f7bd474eae8f1702416a5a:home/.zsh/.zshrc


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -r /home/ez/.opam/opam-init/init.zsh && . /home/ez/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

export LESSCHARSET=utf-8

eval "$(starship init zsh)"
||||||| f6ba3af
=======
export ZDOTDIR="${HOME}/.zsh"
>>>>>>> 56d7da0268eb94e950f7bd474eae8f1702416a5a
