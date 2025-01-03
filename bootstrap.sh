#!/usr/bin/env bash
set -e

git clone --bare git@github.com:jawang35/dotfiles.git "${HOME}/.dotfiles.git"
git --git-dir="${HOME}/.dotfiles.git" --work-tree="${HOME}" checkout
git --git-dir="${HOME}/.dotfiles.git" --work-tree="${HOME}" submodule update --init --recursive
git --git-dir="${HOME}/.dotfiles.git" --work-tree="${HOME}" config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"

if [ "$(uname -s)" == Darwin ]; then
    # Fast keyboard repeat
    defaults write NSGlobalDomain KeyRepeat -int 2
    defaults write NSGlobalDomain InitialKeyRepeat -int 15

    # Disable annoying automatic keyboard settings
    defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
    defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
    defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
    defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
    defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

    # Dark mode
    defaults write AppleInterfaceStyle -string Dark

    # Disable startup sound
    sudo nvram SystemAudioVolume=" "

    # Cloudflare/APNIC DNS
    networksetup -setdnsservers Wi-Fi 1.1.1.1 1.0.0.1 2606:4700:4700::1111 2606:4700:4700::1001 || true

    if command -v brew > /dev/null 2>&1; then
        brew update && brew bundle --file="${HOME}/.config/brew/Brewfile"
    fi
fi

# shellcheck source=.bash_profile
source "${HOME}/.bash_profile"
