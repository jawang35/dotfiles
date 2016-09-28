# Preferred implementations
alias cd.='cd ${HOME}/.dotfiles'
alias cp='cp -iv'
alias ls='ls -AFG'
alias ll='ls -AhlFG'
alias mkdir='mkdir -pv'
alias mv='mv -iv'
alias rm='rm -v'

# ls and pwd after cd
function cd { builtin cd "$@" && ls && echo "Working Directory: $(pwd)"; }

# Git aliases
alias g='git'
alias ga='git add'
alias ga.='git add .'
alias gb='git branch'
alias gc='git commit'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gd='git diff'
alias gf='git fetch'
alias gpu='git push'
alias gpd='git pull'
alias gs='git status'

# tmux aliases
alias t='tmux'
alias ts='tmux new -s'
alias ta='tmux attach -t'
alias tl='tmux ls'
alias tk='tmux kill-session -t'

# Neovim/Vim aliases
if [ -f /usr/local/bin/nvim ]; then
        alias vim='nvim'
fi

alias v='vim'
