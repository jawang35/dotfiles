#!/usr/bin/env bash

set -e

sync () {
    git submodule update --init --recursive
    rsync -avh \
        --no-perms \
        --exclude .dependabot \
        --exclude .DS_Store \
        --exclude .git/ \
        --exclude .gitignore \
        --exclude .gitmodules \
        --exclude bootstrap.sh \
        --exclude docs \
        --exclude LICENSE \
        --exclude README.md \
        . ~
}

if [ "${1}" == "--force" ] || [ "${1}" == "-f" ]; then
	sync
else
	read -r -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo ""
	if [[ "${REPLY}" =~ ^[Yy]$ ]]; then
		sync
	fi
fi

unset sync
