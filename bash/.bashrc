# Reload .bash_profile
alias reload='source ${HOME}/.bash_profile && echo "Loaded ${HOME}/.bash_profile"'

# Preferred implementations
alias cd.='cd ${HOME}/.dotfiles'
alias cd..='cd ..'
alias cp='cp -iv'
alias ls='ls -AFG'
alias ll='ls -AhlFG'
alias mkdir='mkdir -pv'
alias mv='mv -iv'
alias rm='rm -v'
alias rmrf='rm -rf'

# ls and pwd after cd
function cd { builtin cd "$@" && ls && echo -e "\nWorking Directory: $(pwd)"; }

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
alias gm='git merge'
alias gpu='git push'
alias gpd='git pull'
alias gr='git rebase -i'
alias grc='git rebase --continue'
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
alias a='atom'
alias a.='atom .'
