#!/usr/bin/env bash

function __bash_functions {
    function brew-update {
        brew update && brew bundle && brew upgrade && brew bundle cleanup --force
    }

    function submodule-update {
        config submodule update --init --recursive
    }

    # ls after cd
    function cd {
        builtin cd "$@" && ls
    }
}

__bash_functions
