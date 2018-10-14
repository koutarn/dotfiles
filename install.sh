#!/bin/bash
set -eu

cwd=`dirname "${0}"`
DOTFILES_PATH=`(cd "${cwd}" && pwd)`

echo "cwd = ${cwd}"
echo "dotfile_path = ${DOTFILES_PATH}"

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".gitignore" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue

    ln -snfv ${DOTFILES_PATH}/"${f}" ~/"${f}"
done
