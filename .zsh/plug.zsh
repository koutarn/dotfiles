#zplug
bindkey -e

source ~/.zplug/init.zsh
zplug 'zsh-users/zsh-autosuggestions'
zplug "b4b4r07/enhancd", use:init.sh
zplug denysdovhan/spaceship-prompt, use:spaceship.zsh, from:github, as:theme

if ! zplug check --verbose; then
  printf 'Install? [y/N]:'
  if read -q; then
    echo; zplug install
  fi
fi

zplug load
