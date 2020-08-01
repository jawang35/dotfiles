#!/usr/bin/env bash

__bash_prompt() {
    # TODO: Remove PROMPT_COMMAND check when https://github.com/starship/starship/pull/1541 is fixed.
    if [[ "${PROMPT_COMMAND}" != *"starship_precmd"* ]] && command -v starship > /dev/null 2>&1; then
        eval "$(starship init bash)"
    fi
}

__bash_prompt
