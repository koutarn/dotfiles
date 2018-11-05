# 日本語を使用
export LANG=ja_JP.UTF-8

#補完機能
autoload -Uz promptinit
promptinit
prompt adam1

# Use modern completion system
autoload -Uz compinit
compinit

#ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

#vim風バインドキー
bindkey -v

# 色を使用
autoload -Uz colors
colors

# powerline
PLDIRS=(Library/Python/3.6/lib/python/site-packages .local/lib/python3.6/site-packages)
PLCONF="powerline/bindings/zsh/powerline.zsh"
for DIR in ${PLDIRS}; do
  if [ -f ${HOME}/${DIR}/${PLCONF} ]; then
    powerline-daemon -q
    . ${HOME}/${DIR}/${PLCONF}
  fi
done


#単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default

#ここで指定した文字は単語区切りとみなされる
#/ も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

#補完で大文字にもマッチ
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#履歴の保存
HISTFILE=~/.zsh_history
HISTSIZE=1000 #メモリに保存される履歴の件数
SAVEHIST=1000 #履歴ファイルに保存される履歴の件数

# グローバルエイリアス
alias -g L='| less'
alias -g H='| head'
alias -g T='| tails'
alias -g G='| grep'

ZSHRC='~/.zshrc'
VIMRC='~/.vimrc'
VI_MAIN_CFG='~/.vim/init/main.vim'
VI_KEY_CFG='~/.vim/init/keybind.vim'
VI_PLUG_CFG='~/.vim/init/load-plugins.vim'
VI_PLUG_KEY_CFG='~/.vim/advance/setting-plugins.vim'
FISH_CFG='~/.config/fish/config.fish'
TMUX_CFG='~/.tmux.conf'
ALA_CFG='~/.alacritty.yml'

#aliasting variables
alias la='ls -a'
alias fish-config="vi $FISH_CFG"
alias la='ls -vlpA --color=auto'            #詳細表示(隠しファイル含む)
alias so='source'
alias vi='vim'
alias vi-rc="vi $VIMRC"
alias vi-main-config="vi $VI_MAIN_CFG"
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
alias configs="vi $ZSHRC $FISH_CFG $VIMRC $VI_MAIN_CFG $VI_KEY_CFG $VI_PLUG_CFG $VI_PLUG_KEY_CFG $TMUX_CFG $ALA_CFG" #all configs open

# 初回シェル時のみ tmux実行
#if [ $SHLVL = 1 ]; then
#  tmux
#fi


#zplug
bindkey -e

source ~/.zplug/init.zsh
zplug 'zsh-users/zsh-autosuggestions'

if ! zplug check --verbose; then
  printf 'Install? [y/N]:'
  if read -q; then
    echo; zplug install
  fi
fi

zplug load


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
