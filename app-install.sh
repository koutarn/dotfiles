#!bin/bash

apps=(
gnome-tweaks
uluncher
w3m
guake
vagrant
virtualbox
zsh
fish
nkf
ctags
tmux
xsel
silversearcher-ag
)


cat <<UPDATE
===============================
       update settings
===============================
UPDATE

#update
sudo apt update
sudo apt -y upgrade
sudo apt -y dist-upgrade

#install japanese language pack
sudo add-apt-repository -y -n ppa:sicklylife/ppa
sudo apt update
sudo apt upgrade

#change english directory name
LANG=C xdg-usesr-dirs-gtk-update

#update mozk
sudo add-apt-repository -y -n ppa:sicklylife/mozc
sudo apt update
sudo apt dist-upgrade

#stop animation
gsettings set org.gnome.desktop.interface enable-animations false

#change dafult editor
update-alternatives --config editor
