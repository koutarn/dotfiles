#まずはデフォルトのエイリアスを全消し
unalias -m \*

#variable
ZSHRC="${ZDOTDIR}/.zshrc"
ZSHENV="~/.zshenv"
ZSH_ALIAS="${ZDOTDIR}/alias.zsh"
ZSH_PLUG="${ZDOTDIR}/plug.zsh"
ZSH_UTIL="${ZDOTDIR}/main.zsh"
ZSH_OPTION="${ZDOTDIR}/option.zsh"
ZSH_KEY="${ZDOTDIR}/keybind.zsh"
ZSH_CONFIGS="$ZSHRC $ZSHENV $ZSH_ALIAS $ZSH_PLUG $ZSH_UTIL $ZSH_OPTION $ZSH_KEY"

VIMRC='~/.vimrc'
VIMCONF='~/.vim/_config/'
VIM_CONFIGS="$VIMRC $VIMCONF"
TMUX_CFG='~/.tmux.conf'
ALA_CFG='~/.alacritty.yml'

#global alias
alias -g L='| less'
alias -g H='| head'
alias -g T='| tails'
alias -g G='| grep'

#aliasting variables
alias c="cd"
alias ..="cd .."
alias reload-zsh="source $ZSHRC"
alias fish-config="vi $FISH_CFG"
alias vi='vim'
alias vim-configs="vi $VIM_CONFIGS"
alias zsh-configs="vi $ZSH_CONFIGS"

#lsとついでにexaの設定もしておく
alias l="ls -p -v -w 150 -A --color=always"
alias ll="ls -p -v -w 150 -A --color=always"
alias la='ls -vlpA'
alias e="exa -a --icons"
alias el="exa -al --icons"
alias et="exa -T --icons"

alias tmux-cfg="vi $TMUX_CFG"
alias vim-key-cfg="vi $VIM_KEY_CFG"
alias vim-plug-cfg="vi $VIM_PLUG_CFG"
alias vim-plug-key-cfg="vi $VIM_PLUG_KEY_CFG"
alias ala-cfg="vi $ALA_CFG"
alias configs="vi $ZSH_CONFIGS $VIM_CONFIGS $TMUX_CFG $ALA_CFG" #all configs open

#no correct
#nyaみたいなのをださない
alias cp="${ZSH_VERSION:+nocorrect} cp -i"
alias mv="${ZSH_VERSION:+nocorrect} mv -i"
alias mkdir="${ZSH_VERSION:+nocorrect} mkdir"
alias touch="${ZSH_VERSION:+nocorrect} touch"

#trash
alias rm="trash"

#xprop
alias xprop_class="xprop | grep WM_CLASS"
