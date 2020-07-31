#!/usr/bin/env bash

__bash_functions() {
    __config_update() {
        case "${1}" in
            all)
                config pull && config update submodule && config update brew && config update vim-plug && config reload
                ;;
            brew)
                if command -v brew > /dev/null 2>&1; then
                    brew update && brew bundle && brew upgrade && brew bundle cleanup --force
                else
                    echo "brew not found."
                fi
                ;;
            submodule)
                config submodule update --init --recursive
                ;;
            vim-plug)
                vim -i NONE -E +PlugUpdate +PlugClean! +UpdateRemotePlugins +qa!
                ;;
            *)
                echo "${1} is not a valid update command."
        esac
    }

    config() {
        case "${1}" in
            reload)
                source "${HOME}/.bash_profile"
                ;;
            update)
                shift
                __config_update "${@}"
                ;;
            *)
                git --git-dir="${HOME}/.dotfiles.git" --work-tree="${HOME}" "${@}"
        esac
    }

    # ls after cd
    cd() {
        builtin cd "$@" && ls
    }

    # git push track remote
    gput() {
        git push --set-upstream "$(git remote show)" "$(git rev-parse --abbrev-ref HEAD)"
    }
}

__bash_functions
