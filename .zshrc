# 日本語を使用
export LANG=ja_JP.UTF-8


#補完機能 
autoload -Uz promptinit
promptinit
prompt adam1

#自動でpushdを実行
setopt auto_pushd

#pushdから重複を削除
setopt pushd_ignore_dups

#コマンドミスを修正
setopt correct

#vim風バインドキー
bindkey -v

#cdとタイプしなくても移動してくれる
setopt AUTO_CD

setopt histignorealldups sharehistory

# 色を使用
autoload -Uz colors
colors

#他のターミナルとヒストリーを共有
setopt share_history

#プロンプトを2行で表示、時刻を表示
PROMPT="%(?.%{${fg[green]}%}.%{${fg[red]}%})%n${reset_color}@${fg[blue]}%m${reset_color}(%*%) %~
%# "

#補完後、メニュー選択モードになり左右キーで移動が出来る
zstyle ':completion:*:default' menu select=2

#補完で大文字にもマッチ
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#履歴の保存
HISTFILE=~/.zsh_history
HISTSIZE=1000 #メモリに保存される履歴の件数 
SAVEHIST=1000 #履歴ファイルに保存される履歴の件数 

setopt hist_ignore_dups # 重複を記録しない 
setopt hist_ignore_all_dups  # ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除 
setopt hist_ignore_space  # スペースで始まるコマンド行はヒストリリストから削除 
setopt hist_verify  # ヒストリを呼び出してから実行する間に一旦編集可能 
setopt hist_reduce_blanks  # 余分な空白は詰めて記録 
setopt hist_save_no_dups # 古いコマンドと同じものは無視  
setopt hist_no_store  # historyコマンドは履歴に登録しない 
setopt hist_expand  # 補完時にヒストリを自動的に展開          
setopt inc_append_history # 履歴をインクリメンタルに追加 

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

#alias

# グローバルエイリアス
alias -g L='| less'
alias -g H='| head'
alias -g T='| tails'
alias -g G='| grep'

# エイリアス
alias lst='ls -ltr --color=auto'
alias l='ls -ltr --color=auto'
alias la='ls -la --color=auto'
alias ll='ls -l --color=auto'
alias so='source'
alias v='vim'
alias vi='vim'
alias vz='vim ~/.zshrc'

#Ctrl+sのロック, Ctrl+qのロック解除を無効にする
setopt no_flow_control

# 初回シェル時のみ tmux実行
if [ $SHLVL = 1 ]; then
  tmux
fi

# インクリメンタルからの検索
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward
