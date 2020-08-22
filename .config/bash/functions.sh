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

    # open git repository file in web browser
    gopen() {
        local GIT_REPO
        local GIT_BRANCH
        local FILE_PATH="${1}"
        local URL

        GIT_BRANCH=$(git branch --show-current)
        GIT_REPO=$( \
            git remote -v | \
            grep "${REMOTE}" | \
            awk '{print $2}' | \
            head -n1 | \
            sed -e 's/\.git//' \
                -e 's/git@bitbucket\.org:/https:\/\/bitbucket.org\//' \
                -e 's/https:\/\/.*bitbucket\.org:/https:\/\/bitbucket.org\//' \
                -e 's/git@github\.com:/https:\/\/github.com\//' \
                -e 's/https:\/\/github\.com:/https:\/\/github.com\//' \
        )

        case "${GIT_REPO}" in
            *bitbucket*)
                URL="${GIT_REPO}/src/${GIT_BRANCH}/${FILE_PATH}"
                ;;
            *github*)
                if [ -z "${FILE_PATH}" ]; then
                    URL="${GIT_REPO}/tree/${GIT_BRANCH}"
                else
                    URL="${GIT_REPO}/blob/${GIT_BRANCH}/${FILE_PATH}"
                fi
                ;;
        esac

        python -m webbrowser -t "${URL}"
    }
}

__bash_functions
