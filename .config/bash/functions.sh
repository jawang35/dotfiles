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

    gopen() {
        local REMOTE
        local FILE_PATH

        if [ "${#}" -eq 1 ]; then
            REMOTE=origin
            FILE_PATH="${1}"
        elif [ "${#}" -eq 2 ]; then
            REMOTE="${1}"
            FILE_PATH="${2}"
        else
            echo 'Path to file required.'
            return 1
        fi

        GIT_REPO=$( \
            git remote -v | \
            grep "${REMOTE}" | \
            awk '{print $2}' | \
            sort -u | \
            sed -e 's/\.git//' \
                -e 's/git@github\.com:/https:\/\/github.com\//' \
                -e 's/https:\/\/github\.com:/https:\/\/github.com\//' \
        )
        python -m webbrowser -t "${GIT_REPO}/blob/master/${FILE_PATH}"
    }
}

__bash_functions
