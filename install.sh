#!/bin/bash
set -eu

cwd=`dirname "${0}"`
DOTFILES_PATH=`(cd "${cwd}" && pwd)`

echo "                __          __     ____    _     __                   "
echo "           ____/ /  ____   / /_   / __/   (_)   / /  ___    _____     "
echo "         / __   /  / __ \ / __/  / /_    / /   / /  / _ \  / ___/     "
echo "        / /_/  /  / /_/ // /_   / __/   / /   / /  /  __/ (__  )      "
echo "         \__,_/   \____/ \__/  /_/     /_/   /_/   \___/ /____/       "

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".gitignore" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue

    ln -snfv ${DOTFILES_PATH}/${f} ~/${f}
done


#バイナリファイルのリンクを作成する
for f in bin/*
do
    echo $f
    ln -snfv "$PWD/${f}" "/usr/local/${f}"
done

