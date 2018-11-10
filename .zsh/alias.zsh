#まずはデフォルトのエイリアスを全消し
unalias -m \*

ZSHRC="${ZDOTDIR}/.zshrc"
ZSHENV="~/.zshenv"
ZSH_ALIAS="${ZDOTDIR}/alias.zsh"
ZSH_PLUG="${ZDOTDIR}/plug.zsh"
ZSH_UTIL="${ZDOTDIR}/main.zsh"
ZSH_OPTION="${ZDOTDIR}/option.zsh"
ZSH_KEY="${ZDOTDIR}/keybind.zsh"
ZSH_CONFIGS="$ZSHRC $ZSHENV $ZSH_ALIAS $ZSH_PLUG $ZSH_UTIL $ZSH_OPTION $ZSH_KEY"

VIMRC='~/.vimrc'
VI_MAIN_CFG='~/.vim/init/main.vim'
VI_KEY_CFG='~/.vim/init/keybind.vim'
VI_PLUG_CFG='~/.vim/init/load-plugins.vim'
VI_PLUG_KEY_CFG='~/.vim/advance/setting-plugins.vim'
VI_CONFIGS="$VIMRC $VI_MAIN_CFG $VI_KEY_CFG $VI_PLUG_CFG $VI_PLUG_KEY_CFG"
TMUX_CFG='~/.tmux.conf'
ALA_CFG='~/.alacritty.yml'

# グローバルエイリアス
alias -g L='| less'
alias -g H='| head'
alias -g T='| tails'
alias -g G='| grep'

#aliasting variables
alias c="cd"
alias cdd="cd .."
alias rezsh="source $ZSHRC"
alias la='ls -a'
alias fish-config="vi $FISH_CFG"
alias la='ls -vlpA --color=auto'            #詳細表示(隠しファイル含む)
alias so='source'
alias vi='vim'
alias vi-configs="vi $VI_CONFIGS"
alias zsh-configs="vi $ZSH_CONFIGS"
alias l='ls -vptr --color=auto'             #簡易表示
alias ll='ls -vlp --color=auto'             #詳細表示
alias tmux-cfg="vi $TMUX_CFG"
alias vi-key-cfg="vi $VI_KEY_CFG"
alias vi-plug-cfg="vi $VI_PLUG_CFG"
alias vi-plug-key-cfg="vi $VI_PLUG_KEY_CFG"
alias fish-cfg="vi $FISH_CFG"
alias fish-reload='fish_update_completions'
alias ala-cfg="vi $ALA_CFG"
alias net='w3m -m -B https://google.com'
alias ag='ag -S --hidden'
alias agf='ag -S -g'
alias configs="vi $ZSH_CONFIGS $VI_CONFIGS $TMUX_CFG $ALA_CFG" #all configs open
alias treee="tree -alFC -L 2 --dirsfirst"
