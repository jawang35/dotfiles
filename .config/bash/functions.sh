#!/usr/bin/env bash

__bash_functions() {
    config-update-all() {
        config pull && config-update-submodule && config-update-brew && config-update-vim-plug && config-reload
    }

    config-update-brew() {
        brew update && brew bundle && brew upgrade && brew bundle cleanup --force
    }

    config-update-submodule() {
        config submodule update --init --recursive
    }

    config-update-vim-plug() {
        vim -E +PlugInstall +PlugClean! +UpdateRemotePlugins +qa!
    }

    config-reload() {
        source "${HOME}/.bash_profile"
    }

    # ls after cd
    cd() {
        builtin cd "$@" && ls
    }
}

__bash_functions
