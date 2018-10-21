#fishへようこそを消す
set fish_greeting

#powerlineの設定
function fish_prompt
    ~/.local/bin/powerline-shell --shell bare $status
end

function cd
    builtin cd $argv[1]
    #ls -C -a --color=always | cat
    ls -p -v -w 150 -A --color=always
end

#alias
alias l='ls -vptr --color=auto'             #簡易表示
alias ll='ls -vlp --color=auto'             #詳細表示
alias la='ls -vlpA --color=auto'            #詳細表示(隠しファイル含む)
alias so='source'
alias vi='vim'
alias vi-key-config='vim ~/.vim/init/keybind.vim'
alias vi-plug-config='vim ~/.vim/init/plugins.vim'
alias fish-config='vim ~/.config/fish/config.fish'
alias fish-reload='fish_update_completions'
alias net='w3m -m -B https://google.com'
alias ag='ag -S --hidden'
alias agf='ag -S -g'

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

set -U fish_user_paths $HOME/dotfiles/bin $fish_user_paths
set -U fish_user_paths $ENHANCD_DIR $fish_user_paths

#tmuxの呼び出し
init_tmux
