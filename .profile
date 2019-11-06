#!/usr/bin/env bash

# https://github.com/git/git/blob/master/contrib/completion/git-completion.bash
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

# Set EDITOR variable to nvim/vim
if [ -f /usr/local/bin/nvim ]; then
    export EDITOR=/usr/local/bin/nvim
elif [ -f /usr/local/bin/vim ]; then
    export EDITOR=/usr/local/bin/vim
else
    export EDITOR=/usr/bin/vim
fi

export CLICOLOR=1
export LSCOLORS="GxFxCxDxBxegedabagaced" # Mac OS
export LS_COLORS="di=1;36:ln=1;35:so=1;32:pi=1;33:ex=1;31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=34;43" # Linux

export GREP_OPTIONS="--color"
