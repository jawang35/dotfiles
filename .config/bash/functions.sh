#!/usr/bin/env bash

__bash_functions() {
    # ls after cd
    cd() {
        builtin cd "${@}" && ls
    }
}

__bash_functions
unset __bash_functions
