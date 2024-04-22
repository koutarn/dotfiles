#!/bin/bash -eux

echo "Start setup ..."

# brewをインストールし、brew bundleで諸々インストールする
if [ $(uname) = Darwin ]; then
    if ! type brew &> /dev/null ; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
	echo "Since Homebrew is already installed, skip this phase and proceed."
    fi
    brew bundle install --file=./Brewfile
fi

# dotfilesコマンドをインストールする
go install github.com/rhysd/dotfiles@latest

# koutarn/dotfilesをghqする
ghq get -p koutarn/dotfiles

# dotfilesのディレクトリに移動する
ghq list -p | grep dotfiles | cd
