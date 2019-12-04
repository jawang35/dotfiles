#!/usr/bin/env bash

for file in "${HOME}"/.{config,local}/bash/*; do
    if [ -f "${file}" ]; then
        source "${file}"
    fi
done
