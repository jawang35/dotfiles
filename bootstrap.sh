#!/usr/bin/env bash

set -xe

sync () {
    mkdir -p "${2}" && rsync -hgloptvD "${1}" "${2}"
}

git submodule update --init --recursive

sync . "${HOME}"
sync atom "${HOME}/.atom"
sync hammerspoon "${HOME}/.hammerspoon"
sync karabiner "${HOME}/.config/karabiner"

# Vim
if command -v nvim >/dev/null 2>&1; then
    sync vim "${HOME}/.config/nvim"
else
    sync vim "${HOME}/.vim"
fi
