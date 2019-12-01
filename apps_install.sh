#!/bin/bash
set -eu

# git
sudo apt install git -y
# guake
sudo apt install guake -y
# tweeks
sudo apt install gnome-tweaks -y
# tmux
sudo apt install tmux -y

# fzf install
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
source ~/.fzf/install

# zsh instlal
sudo apt install zsh -y
chsh -s /usr/bin/zsh
# zplug install
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# update all
sudo apt update
sudo apt -y upgrade
sudo apt -y dist-upgrade

#change directory name
LANG=C xdg-usesr-dirs-gtk-update

# disable animation
gsettings set org.gnome.desktop.interface enable-animations false 
