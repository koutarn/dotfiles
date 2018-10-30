#fundle
fundle plugin fisherman/fzf
fundle plugin fisherman/z
fundle plugin oh-my-fish/theme-bobthefish
fundle plugin oh-my-fish/plugin-expand
fundle plugin fisherman/spin
fundle plugin 0rax/fish-bd
fundle plugin edc/bass
fundle plugin laughedelic/pisces
fundle plugin oh-my-fish/plugin-balias
fundle plugin masa0x80/replace_multiple_dots.fish
fundle plugin ryotako/fish-expand-range
fundle plugin hagiyat/anyfff
fundle plugin oh-my-fish/theme-bobthefish

fundle init

#fishへようこそを消す
set fish_greetinm

#powerlineの設定
function fish_prompt
  ~/.local/bin/powerline-shell --shell bare $status
end

#function cd
#  builtin cd $argv[1]
#  ls -p -v -w 150 -A --color=always
#end

#setting variables
set VIMRC '~/.vimrc'
set VI_MAIN_CFG '~/.vim/init/main.vim'
set VI_KEY_CFG '~/.vim/init/keybind.vim'
set VI_PLUG_CFG '~/.vim/init/load-plugins.vim'
set VI_PLUG_KEY_CFG '~/.vim/advance/setting-plugins.vim'
set FISH_CFG '~/.config/fish/config.fish'
set TMUX_CFG '~/.tmux.conf'
set ALA_CFG '~/.alacritty.yml'

alias la 'ls -vlpA --color=auto'            #詳細表示(隠しファイル含む)
alias so 'source'
alias v 'vim'
alias vi-rc "vi $VIMRC"
alias vi-main-config "vi $VI_MAIN_CFG"

#balias
alias l 'ls -vptr --color=auto'             #簡易表示
alias ll 'ls -vlp --color=auto'             #詳細表示
alias tmux-cfg "vi $TMUX_CFG"
alias vi-key-cfg "vi $VI_KEY_CFG"
alias vi-plug-cfg "vi $VI_PLUG_CFG"
alias vi-plug-key-cfg "vi $VI_PLUG_KEY_CFG"
alias fish-cfg "vi $FISH_CFG"
alias fish-reload 'fish_update_completions'
alias ala-cfg "vi $ALA_CFG"
alias net 'w3m -m -B https://google.com'
alias ag 'ag -S --hidden'
alias agf 'ag -S -g'
alias configs "vi $FISH_CFG $VIMRC $VI_MAIN_CFG $VI_KEY_CFG $VI_PLUG_CFG $VI_PLUG_KEY_CFG $TMUX_CFG $ALA_CFG" #all configs open

#rbenv
status --is-interactive; and . (rbenv init -|psub)

#FZF
set FZF_DEFAULT_COMMAND 'ag --nocolor --hidden --ignore .git  -g "" -S'
set FZF_DEFAULT_OPTS '--color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108 --color info:108,prompt:109,spinner:108,pointer:168,marker:168 --reverse --border'

# エラーコードは番号で表示する
set -g theme_show_exit_status yes

# Gitのahead情報を細かく表示する
set -g theme_display_git_ahead_verbose yes

#PATHの設定
set PATH $HOME/dotfiles/bin $PATH
set PATH $HOME/.cargo/bin $PATH

set -gx ANYFFF__FINDER_APP fzf

if [ $SHLVL = 1 ]
  tmux
  figlet hello world! 2>/dev/null
end

