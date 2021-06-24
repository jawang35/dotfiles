#!/usr/bin/env bash
set -e

git clone --bare git@github.com:jawang35/dotfiles.git "${HOME}/.dotfiles.git"
git --git-dir="${HOME}/.dotfiles.git" --work-tree="${HOME}" checkout
git --git-dir="${HOME}/.dotfiles.git" --work-tree="${HOME}" submodule update --init --recursive
git --git-dir="${HOME}/.dotfiles.git" --work-tree="${HOME}" config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"

if [ "$(uname -s)" == Darwin ] && command -v brew > /dev/null 2>&1; then
    brew update && brew bundle --file="${HOME}/.config/brew/Brewfile"
fi

# shellcheck source=.bash_profile
source "${HOME}/.bash_profile"
