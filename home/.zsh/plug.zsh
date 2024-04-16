#zplug
#source ~/.zplug/init.zsh
#zplug 'zsh-users/zsh-autosuggestions'    # fishっぽい表示をしてくれる
##zplug "zdharma/fast-syntax-highlighting" # こっちのほうが早いらしいので乗り換え
#zplug "zsh-users/zsh-completions"        # 補完強化
#zplug "plugins/git",   from:oh-my-zsh    # git
#zplug "peterhurford/git-aliases.zsh"     # git用alias
#zplug "mrowa44/emojify", as:command      # コマンドライン上の文字リテラルの絵文字を emoji 化するフィルタコマンド。
# zplug "hlissner/zsh-autopair", defer:2   # カッコを自動で閉じる
#zplug "mollifier/cd-gitroot"             # gitのルートへ飛ぶ
#zplug "hchbaw/auto-fu.zsh"               # 補完候補を自動でだしてくれる
#zplug "yuki-yano/zeno.zsh"               # 補完やabbrevなどの機能提供

#cdを強化
#zplug "b4b4r07/enhancd", use:init.sh
#if zplug check "b4b4r07/enhancd"; then
#  export ENHANCD_FILTER="fzf --height 30% --reverse --ansi"
#  export ENHANCD_DOT_SHOW_FULLPATH=1
#fi
