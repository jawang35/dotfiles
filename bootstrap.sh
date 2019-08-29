#!/usr/bin/env bash

set -xe

sync () {
    mkdir -p "${2}"
    rsync -avh \
        --no-perms \
        -f '- /*/*/' \
        --exclude .git/ \
        --exclude .gitignore \
        --exclude .gitmodules \
        --exclude LICENSE \
        --exclude README.md \
        --exclude bootstrap.sh \
        "${1}" "${2}"
}

git submodule update --init --recursive

rsync -avh \
    --no-perms \
    --exclude .git/ \
    --exclude .gitignore \
    --exclude .gitmodules \
    --exclude LICENSE \
    --exclude README.md \
    --exclude bootstrap.sh \
    . ~
