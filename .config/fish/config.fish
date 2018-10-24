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

#balias
balias l 'ls -vptr --color=auto'             #簡易表示
balias ll 'ls -vlp --color=auto'             #詳細表示
balias la 'ls -vlpA --color=auto'            #詳細表示(隠しファイル含む)
balias so 'source'
balias vi 'vim'
balias vi-main-config 'vim ~/.vim/init/main.vim'
balias vi-key-config 'vim ~/.vim/init/keybind.vim'
balias vi-plug-config 'vim ~/.vim/init/plugins.vim'
balias fish-config 'vim ~/.config/fish/config.fish'
balias fish-reload 'fish_update_completions'
balias net 'w3m -m -B https://google.com'
balias ag 'ag -S --hidden'
balias agf 'ag -S -g'

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

if [ $SHLVL = 1 ]
 figlet hello world! 2>/dev/null
 tmux
end
