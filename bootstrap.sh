#!/usr/bin/env bash
set -e

git clone --bare https://github.com/jawang35/.dotfiles.git "${HOME}/.dotfiles.git"
git --git-dir="${HOME}/.dotfiles.git" --work-tree="${HOME}" checkout
git --git-dir="${HOME}/.dotfiles.git" --work-tree="${HOME}" submodule update --init --recursive
if command -v brew >/dev/null 2>&1; then
    brew bundle --file="${HOME}/Brewfile"
fi

# shellcheck source=.bash_profile
source "${HOME}/.bash_profile"
