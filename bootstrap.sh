#!/usr/bin/env bash
.
..
.DS_Store
.bash_profile
.bashrc
.editorconfig
.git
.gitignore
.gitmodules
.inputrc
.profile
.psqlrc
.shell_prompt.sh
.tmux.conf
LICENSE
README.md
atom
bootstrap.sh
hammerspoon
karabiner
vim

set -xe

sync () {
    mkdir -p "${2}"
    rsync -avh \
        --no-perms \
        -f '- /*/*/' \
        --exclude .git/ \
        --exclude .gitignore \
        --exclude .gitmodules \
        --exclude LICENSE \
        --exclude README.md \
        --exclude bootstrap.sh \
        "${1}" "${2}"
}

git submodule update --init --recursive

sync ./ "${HOME}/"
sync atom/ "${HOME}/.atom/"
sync hammerspoon/ "${HOME}/.hammerspoon/"
sync karabiner/ "${HOME}/.config/karabiner/"

# Vim
if command -v nvim >/dev/null 2>&1; then
    sync vim/ "${HOME}/.config/nvim/"
else
    sync vim/ "${HOME}/.vim/"
fi
