#file load
source "$HOME/.config/fish/autoload/plugins.fish"
source "$HOME/.config/fish/autoload/alias.fish"
source "$HOME/.config/fish/autoload/env.fish"
source "$HOME/.config/fish/autoload/util.fish"

#初回起動はtmuxを起動
if [ $SHLVL = 1 ]
  tmux
end

#Base16設定
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
end

