#!/usr/bin/env bash

if [ -f /usr/local/etc/bash_completion ]; then
    source /usr/local/etc/bash_completion

    # Git completion for aliases
    if command -v __git_complete > /dev/null 2>&1; then
        __git_complete config __git_main
        __git_complete g __git_main
        __git_complete ga _git_add
        __git_complete gb _git_branch
        __git_complete gco _git_checkout
        __git_complete gcob _git_checkout
        __git_complete gd _git_diff
        __git_complete gf _git_fetch
        __git_complete gl _git_log
        __git_complete gm _git_merge
        __git_complete gpu _git_push
        __git_complete gpuf _git_push
        __git_complete gpd _git_pull
        __git_complete gr _git_rebase
        __git_complete gs _git_status
    fi
fi

eval "$(direnv hook bash)"

for file in ${HOME}/.{bash_prompt,aliases,exports,functions,bash_profile.local}; do
    if [ -f "${file}" ]; then source "${file}"; fi
done
