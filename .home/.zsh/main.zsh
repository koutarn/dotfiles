# 日本語を使用
export LANGUAGE="ja_JP.UTF-8"
export LANG="${LANGUAGE}"
export LC_ALL="${LANGUAGE}"

#エディタ、ページャ
export EDITOR="nvim"
export CVSEDITOR="${EDITOR}"
export SVN_EDITOR="${EDITOR}"
export GIT_EDITOR="${EDITOR}"
export PAGER="less"

#ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=${HISTSIZE}

#prompt
autoload -Uz promptinit
promptinit
prompt suse
autoload -Uz colors;colors

#GO
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

#BROWSER
export BROWSER="/usr/bin/google-chrome-stable"

#補完機能
autoload -Uz compinit;compinit

#zshの補完候補が画面から溢れ出るとき、それでも表示するかどうか確認する。
export LISTMAX=0

#vim風バインドキー
bindkey -v

#単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default

#FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#cdしたときにlsする
[ -z "$ENHANCD_ROOT" ] && function chpwd { ls -a } # enhancdがない場合
#[ -z "$ENHANCD_ROOT" ] || export ENHANCD_HOOK_AFTER_CD="ls -p -v -w 150 -A --color=always"  #enhancdがあるときはそのHook機構を使う
[ -z "$ENHANCD_ROOT" ] || export ENHANCD_HOOK_AFTER_CD="exa -a --icons"  #enhancdがあるときはそのHook機構を使う
