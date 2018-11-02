#fishへようこそを消す
set -e fish_greetinm

#powerlineの設定
function fish_prompt
  ~/.local/bin/powerline-shell --shell bare $status
end

function cd
  builtin cd $argv[1]
  ls -p -v -w 150 -A --color=always
end

#rbenv
status --is-interactive; and . (rbenv init -|psub)

# エラーコードは番号で表示する
set -g theme_show_exit_status yes

# Gitのahead情報を細かく表示する
set -g theme_display_git_ahead_verbose yes

set -g __done_min_cmd_duration 5000

# Base16 Shell
if status --is-interactive
 set BASE16_SHELL "$HOME/.config/base16-shell/"
 source "$BASE16_SHELL/profile_helper.fish"
end
