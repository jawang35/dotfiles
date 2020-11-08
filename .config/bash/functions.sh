#!/usr/bin/env bash

__bash_functions() {
    # ls after cd
    cd() {
        builtin cd "${@}" && ls
    }

    # git push track remote
    gput() {
        git push --set-upstream "$(git remote show)" "$(git rev-parse --abbrev-ref HEAD)"
    }
}

__bash_functions
