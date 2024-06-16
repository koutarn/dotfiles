#GO
export GOPATH=$HOME/go
export GOBIN=$PATH:$GOPATH/bin
export PATH=$PATH:$GOPATH/bin

#Home brew
export PATH=/opt/homebrew/bin:$PATH
export EDITOR=/opt/homebrew/bin/nvim

# zsh plugins
eval "$(sheldon source)"

# starship
eval "$(starship init zsh)"

# the fuck
if type ! "fuck" > /dev/null 2>&1; then
	eval $(thefuck --alias)
fi

export LESSCHARSET=utf-8
export GREP_OPTIONS="--color=auto"
