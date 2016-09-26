if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

if [ -f /usr/local/bin/nvim ]; then
        export EDITOR=/usr/local/bin/nvim
else
        export EDITOR=/usr/bin/vim
fi
