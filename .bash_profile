#!/usr/bin/env bash

source .profile
source .bashrc
source .shell_prompt.sh

if [ -f ".bash_profile.local" ]; then source .bash_profile.local; fi
