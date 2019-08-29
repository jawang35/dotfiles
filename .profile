#!/usr/bin/env bash

# https://github.com/git/git/blob/master/contrib/completion/git-completion.bash
if [ -f ~/git-completion.bash ]; then
    source ~/git-completion.bash

    # Git completion for aliases
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

# Set EDITOR variable to nvim/vim
if [ -f /usr/local/bin/nvim ]; then
    export EDITOR=/usr/local/bin/nvim
elif [ -f /usr/local/bin/vim ]; then
    export EDITOR=/usr/local/bin/vim
else
    export EDITOR=/usr/bin/vim
fi

export GREP_OPTIONS="--color"
