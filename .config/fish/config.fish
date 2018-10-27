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

#setting variables
set VIMRC '~/.vimrc'
set VI_MAIN_CFG '~/.vim/init/main.vim'
set VI_KEY_CFG '~/.vim/init/keybin.vim'
set VI_PLUG_CFG '~/.vim/init/load-plugins.vim'
set VI_PLUG_KEY_CFG '~/.vim/advance/setting-plugins.vim'
set FISH_CFG '~/.config/fish/config.fish'

#alias
balias l 'ls -vptr --color=auto'             #簡易表示
balias ll 'ls -vlp --color=auto'             #詳細表示
balias la 'ls -vlpA --color=auto'            #詳細表示(隠しファイル含む)
balias so 'source'
balias vi 'vim'
balias vi-rc "vi $VIMRC"
balias vi-main-config "vi $VI_MAIN_CFG"
balias vi-key-config "vi $VI_KEY_CFG"
balias vi-plug-config "vi $VI_PLUG_CFG"
balias vi-plug-key-config "vi $VI_PLUG_KEY_CFG"
balias fish-config "vi $FISH_CFG"
balias fish-reload 'fish_update_completions'
balias net 'w3m -m -B https://google.com'
balias ag 'ag -S --hidden'
balias agf 'ag -S -g'
balias configs "vi $FISH_CFG $VIMRC $VI_MAIN_CFG $VI_KEY_CFG $VI_PLUG_CFG $VI_PLUG_KEY_CFG" #all configs open

#rbenv
status --is-interactive; and . (rbenv init -|psub)

#FZF
set FZF_DEFAULT_COMMAND 'ag --nocolor --hidden --ignore .git  -g "" -S'
set FZF_DEFAULT_OPTS '--color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108 --color info:108,prompt:109,spinner:108,pointer:168,marker:168 --reverse --border'

# エラーコードは番号で表示する
set -g theme_show_exit_status yes

# Gitのahead情報を細かく表示する
set -g theme_display_git_ahead_verbose yes

set PATH $HOME/dotfiles/bin $PATH

if [ $SHLVL = 1 ]
  tmux
  figlet hello world! 2>/dev/null
end
