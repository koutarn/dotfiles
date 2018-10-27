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
balias vi-plug-key-config 'vim ~/.vim/plugins/plugins.vim'
balias fish-config 'vim ~/.config/fish/config.fish'
balias fish-reload 'fish_update_completions'
balias net 'w3m -m -B https://google.com'
balias ag 'ag -S --hidden'
balias agf 'ag -S -g'
balias configs 'vim ~/.vim/init/main.vim ~/.vim/init/keybind.vim ~/.vim/init/plugins.vim ~/.vim/plugins/plugins.vim ~/.config/fish/config.fish' #all configs open

#rbenv
status --is-interactive; and . (rbenv init -|psub)

#FZF
set FZF_DEFAULT_COMMAND 'ag --nocolor --hidden -g'
set FZF_DEFAULT_OPTS '--color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108 --color info:108,prompt:109,spinner:108,pointer:168,marker:168 --reverse --border'

# エラーコードは番号で表示する
set -g theme_show_exit_status yes

# Gitのahead情報を細かく表示する
set -g theme_display_git_ahead_verbose yes

set PATH $HOME/dotfiles/bin $PATH

if [ $SHLVL = 1 ]
  figlet hello world! 2>/dev/null
  tmux
end
