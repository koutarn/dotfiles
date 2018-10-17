#fishへようこそを消す
set fish_greeting

#powerlineの設定
function fish_prompt
    ~/.local/bin/powerline-shell --shell bare $status
end

#alias
alias lst='ls -ltr --color=auto'
alias l='ls -ltr --color=auto'
alias la='ls -la --color=auto'
alias ll='ls -l --color=auto'
alias so='source'
alias vi='vim'
alias fs='vim ~/.config/fish/config.fish'
alias fs-reload='fish_update_completions'

#rbenv
status --is-interactive; and . (rbenv init -|psub)

# 一覧の上を最新として、境目をボーダーに
set -x FZF_DEFAULT_OPTS "--reverse --border"

# ディレクトリ検索で選択した項目の配下の構成をプレビューに表示する
set -x FZF_ALT_C_OPTS   "--preview 'tree -C {} | head -200'"

# ファイル検索で選択した項目の中身をプレビューに表示する
set -x FZF_CTRL_T_OPTS  "--preview 'head -100 {}'"

# エラーコードは番号で表示する
set -g theme_show_exit_status yes

# Gitのahead情報を細かく表示する
set -g theme_display_git_ahead_verbose yes

# dotfiles/binのパスを通す
set PATH /usr/local/bin /usr/sbin $PATH

#tmux呼び出し
init_tmux

