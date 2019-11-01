#!/usr/bin/env bash
set -xe

source ${HOME}/.bash_profile
config submodule update --init --recursive
if command -v brew >/dev/null 2>&1; then
    brew bundle
fi
