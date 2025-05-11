#!/usr/bin/env bash

if [ -f "${HOMEBREW_PREFIX}/bin/bash" ]; then
    export SHELL="${HOMEBREW_PREFIX}/bin/bash"
else
    export SHELL=/bin/bash
fi

for file in "${HOME}"/.{config,local}/bash/*; do
    if [ -f "${file}" ]; then
        source "${file}"
    fi
done

if [ -f "${HOME}/.bashrc" ]; then
    source "${HOME}/.bashrc"
fi
