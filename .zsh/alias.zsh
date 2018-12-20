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
VIM_MAIN_CFG='~/.vim/init/main.vim'
VIM_KEY_CFG='~/.vim/init/bind.vim'
VIM_PLUG_CFG='~/.vim/advance/load-plugins.vim'
VIM_PLUG_KEY_CFG='~/.vim/advance/setting-plugins.vim'
VIM_CONFIGS="$VIMRC $VIM_MAIN_CFG $VIM_KEY_CFG $VIM_PLUG_CFG $VIM_PLUG_KEY_CFG"
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
alias so='source'
alias vi='vim'
alias vim-configs="vi $VIM_CONFIGS"
alias zsh-configs="vi $ZSH_CONFIGS"
alias l='ls -vptr'
alias ll='ls -avptr'
alias la='ls -vlpA'
alias tmux-cfg="vi $TMUX_CFG"
alias vim-key-cfg="vi $VIM_KEY_CFG"
alias vim-plug-cfg="vi $VIM_PLUG_CFG"
alias vim-plug-key-cfg="vi $VIM_PLUG_KEY_CFG"
alias fish-cfg="vi $FISH_CFG"
alias fish-reload='fish_update_completions'
alias ala-cfg="vi $ALA_CFG"
alias net='w3m -m -B https://google.com'
alias ag='ag -S --hidden'
alias agf='ag -S -g'
alias configs="vi $ZSH_CONFIGS $VIM_CONFIGS $TMUX_CFG $ALA_CFG" #all configs open
alias treee="tree -alFC -L 2 --dirsfirst"
alias todo="vim $HOME/Dropbox/Note/01_INBOX/_Todo.md"
alias pdf="evince"

#base16
alias materia="base16_materia"
alias monokai="base16_monokai"
alias gruvbox="base16_gruvbox-dark-hard"
alias solarized="base16_solarized-dark"

#no correct
#nyaみたいなのをださない
alias cp="${ZSH_VERSION:+nocorrect} cp -i"
alias mv="${ZSH_VERSION:+nocorrect} mv -i"
alias mkdir="${ZSH_VERSION:+nocorrect} mkdir"
alias touch="${ZSH_VERSION:+nocorrect} touch"
