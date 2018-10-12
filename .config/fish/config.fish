#powerlineの設定
function fish_prompt
    ~/.local/bin/powerline-shell --shell bare $status
end

#alias
alias lst='ls -ltr --color=auto'
alias l='ls -ltr --color=auto'
alias la='ls -la --color=auto'
alias ll='ls -l --color=auto'
alias so='source'
alias vi='vim'
alias fs='vim ~/.config/fish/config.fish'
alias fs-reload='fish_update_completions'

#rbenv
status --is-interactive; and . (rbenv init -|psub)
