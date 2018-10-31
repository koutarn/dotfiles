#setting variables
set -x VIMRC '~/.vimrc'
set -x VI_MAIN_CFG '~/.vim/init/main.vim'
set -x VI_KEY_CFG '~/.vim/init/keybind.vim'
set -x VI_PLUG_CFG '~/.vim/init/load-plugins.vim'
set -x VI_PLUG_KEY_CFG '~/.vim/advance/setting-plugins.vim'
set -x FISH_CFG '~/.config/fish/config.fish'
set -x TMUX_CFG '~/.tmux.conf'
set -x ALA_CFG '~/.alacritty.yml'

balias la 'ls -vlpA --color=auto'            #詳細表示(隠しファイル含む)
balias so 'source'
balias v 'vim'
balias vi-rc "vi $VIMRC"
balias vi-main-config "vi $VI_MAIN_CFG"

#balias
balias l 'ls -vptr --color=auto'             #簡易表示
balias ll 'ls -vlp --color=auto'             #詳細表示
balias tmux-cfg "vi $TMUX_CFG"
balias vi-key-cfg "vi $VI_KEY_CFG"
balias vi-plug-cfg "vi $VI_PLUG_CFG"
balias vi-plug-key-cfg "vi $VI_PLUG_KEY_CFG"
balias fish-cfg "vi $FISH_CFG"
balias fish-reload 'fish_update_completions'
balias ala-cfg "vi $ALA_CFG"
balias net 'w3m -m -B https://google.com'
balias ag 'ag -S --hidden'
balias agf 'ag -S -g'
balias configs "vi $FISH_CFG $VIMRC $VI_MAIN_CFG $VI_KEY_CFG $VI_PLUG_CFG $VI_PLUG_KEY_CFG $TMUX_CFG $ALA_CFG" #all configs open

#FZF
set -x FZF_DEFAULT_COMMAND 'ag --nocolor --hidden --ignore .git  -g "" -S'
set -x FZF_DEFAULT_OPTS '--color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108 --color info:108,prompt:109,spinner:108,pointer:168,marker:168 --reverse --border'
