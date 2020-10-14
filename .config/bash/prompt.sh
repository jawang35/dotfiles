#!/usr/bin/env bash

__bash_prompt() {
    if command -v starship > /dev/null 2>&1; then
        eval "$(starship init bash)"
    fi
}

__bash_prompt
