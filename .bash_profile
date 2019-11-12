#!/usr/bin/env bash

# shellcheck source=.profile
source "${HOME}/.profile"
# shellcheck source=.bashrc
source "${HOME}/.bashrc"
# shellcheck source=.bash_prompt
source "${HOME}/.bash_prompt"

if [ -f "${HOME}/.bash_profile.local" ]; then source "${HOME}/.bash_profile.local"; fi
