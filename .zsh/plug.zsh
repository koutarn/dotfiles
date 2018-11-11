#zplug
bindkey -e

source ~/.zplug/init.zsh
zplug 'zsh-users/zsh-autosuggestions'                                                   #fishっぽい表示をしてくれる
zplug "zsh-users/zsh-syntax-highlighting", defer:2                                      #syntax highlight
zplug "zsh-users/zsh-completions"                                                       #補完ファイル
zplug "plugins/git",   from:oh-my-zsh                                                   #git
zplug "peterhurford/git-aliases.zsh"                                                    #git用alias
zplug "mrowa44/emojify", as:command                                                     #コマンドライン上の文字リテラルの絵文字を emoji 化するフィルタコマンド。

zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme          #prompt
if zplug check "denysdovhan/spaceship-prompt";then
  export SPACESHIP_CHAR_SYMBOL="🚀 "                                                    #ロケットを表示
  export SPACESHIP_USER_SHOW=always                                                      #ユーザー名を常に表示しない

  #false
  export SPACESHIP_EXEC_TIME_SHOW=false                                                 #実行時間の非表示
  export SPACESHIP_HOST_SHOW=false                                                      #ホスト名
  export SPACESHIP_TIME_SHOW=false                                                      #時間を表示
#  export SPACESHIP_TIME_COLOR=blue                                                      #時間の色を青色にする
#  export SPACESHIP_TIME_PREFIX=" ["
#  export SPACESHIP_TIME_SUFFIX="] "

  #promptの表示順番を決定する
  SPACESHIP_PROMPT_ORDER=(
  dir           # Current directory section
  user          # Username section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  package       # Package version
  node          # Node.js section
  ruby          # Ruby section
  elixir        # Elixir section
  xcode         # Xcode section
  swift         # Swift section
  golang        # Go section
  php           # PHP section
  rust          # Rust section
  haskell       # Haskell Stack section
  julia         # Julia section
  docker        # Docker section
  aws           # Amazon Web Services section
  venv          # virtualenv section
  conda         # conda virtualenv section
  pyenv         # Pyenv section
  dotnet        # .NET section
  ember         # Ember.js section
  kubecontext   # Kubectl context section
  exec_time     # Execution time
  time          # Time stamps section
  line_sep      # Line break
  battery       # Battery level and status
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
  )
fi

zplug "b4b4r07/enhancd", use:init.sh                                                    #cdを強化
if zplug check "b4b4r07/enhancd"; then
  export ENHANCD_FILTER="fzf --height 30% --reverse --ansi"
  export ENHANCD_DOT_SHOW_FULLPATH=1
fi


if ! zplug check --verbose; then
  printf 'Install? [y/N]:'
  if read -q; then
    echo; zplug install
  fi
fi

zplug load
