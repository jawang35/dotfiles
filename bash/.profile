if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

if [ -f /usr/local/bin/nvim ]; then
        export EDITOR=/usr/local/bin/nvim
elif [ -f /usr/local/bin/vim ]; then
        export EDITOR=/usr/local/bin/vim
else
        export EDITOR=/usr/bin/vim
fi
