#!/usr/bin/env bash

# shellcheck source=.bashrc
source "${HOME}/.bashrc"

if [ -z "${TMUX}" ] && command -v neofetch >/dev/null 2>&1; then
    neofetch
fi
