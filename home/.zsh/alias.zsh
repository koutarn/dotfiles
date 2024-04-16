#まずはデフォルトのエイリアスを全消し
unalias -m \*

#variable
ZSHRC="~/.zshrc"
ZSHENV="~/.zshenv"
ZSH_ALIAS="${ZDOTDIR}/alias.zsh"
ZSH_PLUG="${ZDOTDIR}/plug.zsh"
ZSH_UTIL="${ZDOTDIR}/main.zsh"
ZSH_OPTION="${ZDOTDIR}/option.zsh"
ZSH_KEY="${ZDOTDIR}/keybind.zsh"
ZSH_CONFIGS="$ZSHRC $ZSHENV $ZSH_ALIAS $ZSH_PLUG $ZSH_UTIL $ZSH_OPTION $ZSH_KEY"

VIMRC='~/.vimrc'

#global alias
alias -g L='| less'
alias -g H='| head'
alias -g T='| tails'
alias -g G='| grep'

#aliasting variables
alias c="cd"
alias ..="cd .."
alias reload-zsh="source $ZSHRC"
alias v='nvim'
alias vi='nvim'
alias vim='nvim'

#lsとついでにexaの設定もしておく
alias l="ls -p -v -w 150 -A --color=always"
alias ll="ls -p -v -w 150 -A --color=always"
alias la='ls -vlpA'
alias e="eza -a --icons"
alias el="eza -al --icons"
alias et="eza -T --icons"

alias tmux-cfg="vi $TMUX_CFG"
alias ala-cfg="vi $ALA_CFG"
alias configs="vi $ZSH_CONFIGS $VIM_CONFIGS $TMUX_CFG $ALA_CFG" #all configs open

#trash
alias rm="trash"

#xprop
alias xprop_class='xprop | grep WM_CLASS'

#ghq
alias f="ghq list -p | fzf | cd"
