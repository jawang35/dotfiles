#!/usr/bin/env bash
set -e

git --git-dir=${HOME}/.dotfiles.git --work-tree=${HOME} submodule update --init --recursive
if command -v brew >/dev/null 2>&1; then
    brew bundle
fi

source ${HOME}/.bash_profile
