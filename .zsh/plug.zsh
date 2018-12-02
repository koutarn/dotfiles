#zplug
bindkey -e

source ~/.zplug/init.zsh
zplug 'zsh-users/zsh-autosuggestions'                                                   #fishっぽい表示をしてくれる
zplug "zsh-users/zsh-syntax-highlighting", defer:2                                      #syntax highlight
zplug "zsh-users/zsh-completions"                                                       #補完強化
zplug "plugins/git",   from:oh-my-zsh                                                   #git
zplug "peterhurford/git-aliases.zsh"                                                    #git用alias
zplug "mrowa44/emojify", as:command                                                     #コマンドライン上の文字リテラルの絵文字を emoji 化するフィルタコマンド。
zplug "hlissner/zsh-autopair", defer:2                                                  #カッコを自動で閉じる
zplug "mollifier/cd-gitroot"                                                            #gitのルートへ飛ぶ

#prompt
zplug "denysdovhan/spaceship-prompt"
if zplug check "denysdovhan/spaceship-prompt";then

  #シンボル
  export SPACESHIP_CHAR_SYMBOL="→ "                                                   #ロケットを表示

  #ユーザー名
  export SPACESHIP_USER_SHOW=always                                                     #ユーザー名を常に表示する
  export SPACESHIP_USER_PREFIX="with "                                                  #ユーザー名の前の文字
  export SPACESHIP_USER_SUFFIX=" 🚀 "                                                   #ユーザー名の後の文字

  #time
  export SPACESHIP_TIME_SHOW=true                                                       #時間を表示
  export SPACESHIP_TIME_PREFIX="time. "
  export SPACESHIP_TIME_COLOR="blue"                                                    #時間の色を青色にする

  #exec time
  export SPACESHIP_EXEC_TIME_SHOW=true                                                  #実行時間の非表示
  export SPACESHIP_EXEC_TIME_PREFIX="exec. "                                            #prefix

  #battery
  SPACESHIP_BATTERY_SHOW=always
  SPACESHIP_BATTERY_PREFIX=" "
  SPACESHIP_BATTERY_SUFFIX="⚡ "

  #false
  export SPACESHIP_HOST_SHOW=false                                                      #ホスト名

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
    line_sep      # Line break
    vi_mode       # Vi-mode indicator
    jobs          # Background jobs indicator
    exit_code     # Exit code section
    char          # Prompt character
  )

  #right prompt
  SPACESHIP_RPROMPT_ORDER=(
    time          #Time stamps section
    exec_time     # Execution time
    battery       # Battery level and status
  )

fi

#cdを強化
zplug "b4b4r07/enhancd", use:init.sh
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
