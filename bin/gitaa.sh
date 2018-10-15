#!bin/bash

#.git ファイルがあるかを確認する
if ! [ -e "${PWD}/.git" ] ; then
    echo ".gitファイルが存在しません"
    exit
fi

#全て加える
git add -A

