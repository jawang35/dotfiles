#!/usr/bin/env bash

function __bash_profile {
    if command -v brew > /dev/null 2>&1; then
        local BREW_PREFIX
        BREW_PREFIX="$(brew --prefix)"

        # bash-completion
        if [ -f "${BREW_PREFIX}/etc/profile.d/bash_completion.sh" ]; then
            export BASH_COMPLETION_COMPAT_DIR="${BREW_PREFIX}/etc/bash_completion.d"
            source "${BREW_PREFIX}/etc/profile.d/bash_completion.sh"
        fi

        # fzf
        if [[ ! "$PATH" == "*${BREW_PREFIX}/opt/fzf/bin*" ]]; then
            export PATH="${PATH:+${PATH}:}${BREW_PREFIX}/opt/fzf/bin"
        fi
        [[ $- == *i* ]] && source "${BREW_PREFIX}/opt/fzf/shell/completion.bash" 2> /dev/null
        source "${BREW_PREFIX}/opt/fzf/shell/key-bindings.bash"
    fi

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

    if command -v direnv > /dev/null 2>&1; then
        eval "$(direnv hook bash)"
    fi
}

__bash_profile
