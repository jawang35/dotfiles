#!/usr/bin/env bash
set -e

source ${HOME}/.bash_profile
git --git-dir=${HOME}/.dotfiles.git --work-tree=${HOME} submodule update --init --recursive
if command -v brew >/dev/null 2>&1; then
    brew bundle
fi
