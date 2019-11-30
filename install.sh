#!/bin/bash
set -eu

#cwd=$(dirname "${0}")
DOTFILES_PATH="dotfile"

echo "          __          __     ____    _     __                "
echo "     ____/ /  ____   / /_   / __/   (_)   / /  ___    _____  "
echo "   / __   /  / __ \ / __/  / /_    / /   / /  / _ \  / ___/  "
echo "  / /_/  /  / /_/ // /_   / __/   / /   / /  /  __/ (__  )   "
echo "   \__,_/   \____/ \__/  /_/     /_/   /_/   \___/ /____/    "

echo "========================================="
echo "dotfiles install to $HOME"
echo "========================================="
for f in .??*
do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".gitignore" ] && continue
    [ "$f" = ".DS_Store" ] && continue

    ln -isnfv "$DOTFILES_PATH/${f}" "$HOME/${f}"
done
