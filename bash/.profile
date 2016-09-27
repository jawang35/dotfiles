if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

if [ -f ${HOME}/.git-completion.bash ]; then
        source ${HOME}/.git-completion.bash

        __git_complete g __git_main
        __git_complete ga _git_add
        __git_complete gb _git_branch
        __git_complete gco _git_checkout
        __git_complete gcob _git_checkout
        __git_complete gd _git_diff
        __git_complete gf _git_fetch
        __git_complete gpu _git_push
        __git_complete gpd _git_pull
fi

if [ -f /usr/local/bin/nvim ]; then
        export EDITOR=/usr/local/bin/nvim
elif [ -f /usr/local/bin/vim ]; then
        export EDITOR=/usr/local/bin/vim
else
        export EDITOR=/usr/bin/vim
fi
