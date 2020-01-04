#!/usr/bin/env bash

function __bash_functions {
    function config-update-all {
        config pull && config-update-submodule && config-update-brew && config-update-vim-plug && config-reload
    }

    function config-update-brew {
        brew update && brew bundle && brew upgrade && brew bundle cleanup --force
    }

    function config-update-submodule {
        config submodule update --init --recursive
    }

    function config-update-vim-plug {
        vim -E +PlugInstall +PlugClean! +UpdateRemotePlugins +qa!
    }

    function config-reload {
        source "${HOME}/.bash_profile"
    }

    # ls after cd
    function cd {
        builtin cd "$@" && ls
    }
}

__bash_functions
