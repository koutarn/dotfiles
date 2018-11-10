#zplug
bindkey -e

source ~/.zplug/init.zsh
zplug 'zsh-users/zsh-autosuggestions'                                                   #fishっぽい表示をしてくれる
zplug "zsh-users/zsh-syntax-highlighting", defer:2                                      #syntax highlight
zplug "b4b4r07/enhancd", use:init.sh                                                    #cdを強化
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme          #prompt
zplug "zsh-users/zsh-completions"                                                       #補完ファイル
zplug "plugins/git",   from:oh-my-zsh
zplug "peterhurford/git-aliases.zsh"
zplug "mrowa44/emojify", as:command                                                     #コマンドライン上の文字リテラルの絵文字を emoji 化するフィルタコマンド。

if ! zplug check --verbose; then
  printf 'Install? [y/N]:'
  if read -q; then
    echo; zplug install
  fi
fi

zplug load
