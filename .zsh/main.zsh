# 日本語を使用
export LANGUAGE="ja_JP.UTF-8"
export LANG="${LANGUAGE}"
export LC_ALL="${LANGUAGE}"

#エディタ、ページャ
export EDITOR="vim"
export CVSEDITOR="${EDITOR}"
export SVN_EDITOR="${EDITOR}"
export GIT_EDITOR="${EDITOR}"
export PAGER="less"

#ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=${HISTSIZE}

#prompt
autoload -Uz promptinit
promptinit
prompt suse
autoload -Uz colors
colors

#補完機能
autoload -Uz compinit
compinit

#zshの補完候補が画面から溢れ出るとき、それでも表示するかどうか確認する。
export LISTMAX=0

#vim風バインドキー
bindkey -v

#単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default

#ここで指定した文字は単語区切りとみなされる
#/ も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

#補完で大文字にもマッチ
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
[ -s "$BASE16_SHELL/profile_helper.sh" ] && \
eval "$("$BASE16_SHELL/profile_helper.sh")"


#初回シェル時のみ tmux実行
if [ $SHLVL = 1 ]; then
  tmux
fi

#FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
