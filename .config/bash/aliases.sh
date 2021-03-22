#!/usr/bin/env bash

__bash_aliases() {
    # Preferred implementations
    alias cd..='cd ..'
    alias cp='cp -iv'
    alias ls='ls -AF --color=auto'
    alias ll='ls -AhlF --color=auto'
    alias mkdir='mkdir -pv'
    alias mv='mv -iv'
    alias rm='rm -v'
    alias rmrf='rm -rf'
    alias ssh='TERM=screen-256color ssh'
    alias sshnc='ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'

    # Git aliases
    alias g='git'
    alias ga='git add'
    alias ga.='git add .'
    alias gb='git branch'
    alias gc='git commit'
    alias gca='git commit --amend'
    alias gco='git checkout'
    alias gco.='git checkout .'
    alias gcob='git checkout -b'
    alias gcom='git checkout master'
    alias gd='git diff'
    alias gd.='git diff .'
    alias gf='git fetch'
    alias gl='git --no-pager log --oneline'
    alias gm='git merge'
    alias gpu='git push'
    alias gpuf='git push --force'
    alias gpd='git pull'
    alias gr='git rebase -i'
    alias grc='git rebase --continue'
    alias gs='git status'

    # tmux aliases
    alias tmux='tmux -f "${HOME}/.config/tmux/tmux.conf"'
    alias t='tmux'
    alias ts='tmux new -s'
    alias ta='tmux attach -t'
    alias tl='tmux ls'
    alias tk='tmux kill-session -t'

    # Neovim/Vim aliases
    if command -v nvim > /dev/null 2>&1; then
        alias vim='nvim'
    fi

    alias v='vim'
}

__bash_aliases
unset __bash_aliases
