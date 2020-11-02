#!/usr/bin/env bash

__bash_functions() {
    __config_update() {
        case "${1}" in
            all)
                config pull && config update submodule && config update brew && config update python && config update vim-plug && config reload
                ;;
            brew)
                if command -v brew > /dev/null 2>&1; then
                    brew update && brew upgrade && brew bundle cleanup --force && brew bundle
                else
                    echo "brew not found."
                fi
                ;;
            python)
                pip3 install -r "${HOME}/.config/python/requirements.txt"
                ;;
            submodule)
                config submodule update --init --recursive
                ;;
            vim-plug)
                vim -i NONE -E +PlugUpdate +PlugClean! +UpdateRemotePlugins +qa!
                ;;
            *)
                echo "\"${1}\" is not a valid update command."
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
        local GIT_BRANCH
        local GIT_PATH
        local GIT_REPO
        local GIT_ROOT_DIR
        local TARGET_DIR
        local TARGET_FILE
        local TARGET_PATH="${1-.}"
        local URL

        if [ -f "${TARGET_PATH}" ]; then
            pushd "$(dirname "${TARGET_PATH}")" > /dev/null || return
            TARGET_DIR=$(pwd)
            TARGET_FILE=$(basename "${TARGET_PATH}")
        else
            pushd "${TARGET_PATH}" > /dev/null || return
            TARGET_DIR=$(pwd)
        fi

        GIT_ROOT_DIR=$(git rev-parse --show-toplevel)
        if [ -z "${GIT_ROOT_DIR}" ]; then
            return 1
        fi

        TARGET_DIR="${TARGET_DIR#${GIT_ROOT_DIR}}"
        GIT_BRANCH=$(git branch --show-current)
        GIT_BRANCH="${GIT_BRANCH-master}"
        GIT_REPO=$( \
            git remote -v | \
            grep origin | \
            awk '{print $2}' | \
            head -n1 | \
            sed -e 's/\.git//' \
                -e 's/git@bitbucket\.org:/https:\/\/bitbucket.org\//' \
                -e 's/https:\/\/.*bitbucket\.org:/https:\/\/bitbucket.org\//' \
                -e 's/git@github\.com:/https:\/\/github.com\//' \
                -e 's/https:\/\/github\.com:/https:\/\/github.com\//' \
        )

        if [ -z "${TARGET_DIR}" ]; then
            GIT_PATH="/${TARGET_FILE}"
        else
            GIT_PATH="${TARGET_DIR}/${TARGET_FILE}"
        fi

        case "${GIT_REPO}" in
            *bitbucket*)
                URL="${GIT_REPO}/src/${GIT_BRANCH}${GIT_PATH}"
                ;;
            *github*)
                if [ "${GIT_PATH}" == '/' ]; then
                    URL="${GIT_REPO}/tree/${GIT_BRANCH}"
                else
                    URL="${GIT_REPO}/blob/${GIT_BRANCH}${GIT_PATH}"
                fi
                ;;
        esac

        python -m webbrowser -t "${URL}"

        popd > /dev/null || return
    }

    urldecode() {
        python -c "import urllib.parse; print(urllib.parse.unquote('${1}'))"
    }

    urlencode() {
        python -c "import urllib.parse; print(urllib.parse.quote('${1}'))"
    }
}

__bash_functions
