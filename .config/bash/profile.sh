#!/usr/bin/env bash

function __bash_profile {
    # bash-completion
    if [ -f '/usr/local/etc/profile.d/bash_completion.sh' ]; then
        export BASH_COMPLETION_COMPAT_DIR='/usr/local/etc/bash_completion.d'
        source '/usr/local/etc/profile.d/bash_completion.sh'
    fi

    # fzf
    if [ -d '/usr/local/opt/fzf' ]; then
        if [[ ! "$PATH" == "*/usr/local/opt/fzf/bin*" ]]; then
            export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
        fi
        [[ $- == *i* ]] && source '/usr/local/opt/fzf/shell/completion.bash' 2> /dev/null
        source '/usr/local/opt/fzf/shell/key-bindings.bash'

        _fzf_setup_completion path v

        export FZF_DEFAULT_COMMAND='fd --exclude .git --hidden --type f'
        export FZF_DEFAULT_OPTS='--height 40%'
        export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"
        export FZF_CTRL_T_OPTS="${FZF_DEFAULT_OPTS} --preview='bat {} | head -500'"
        export FZF_CTRL_R_OPTS="${FZF_DEFAULT_OPTS} --reverse"

        # Use fd to generate the list for path completion
        _fzf_compgen_path() {
            fd --exclude .git --hidden --follow . "${1}"
        }

        # Use fd to generate the list for directory completion
        _fzf_compgen_dir() {
            fd --exclude .git --hidden --follow --type d . "${1}"
        }
    fi

    # Git completion for aliases
    if command -v __git_complete > /dev/null 2>&1; then
        __git_complete config __git_main
        __git_complete g __git_main
        __git_complete ga _git_add
        __git_complete gb _git_branch
        __git_complete gco _git_checkout
        __git_complete gcob _git_checkout
        __git_complete gd _git_diff
        __git_complete gf _git_fetch
        __git_complete gl _git_log
        __git_complete gm _git_merge
        __git_complete gpu _git_push
        __git_complete gpuf _git_push
        __git_complete gpd _git_pull
        __git_complete gr _git_rebase
        __git_complete gs _git_status
    fi

    if command -v direnv > /dev/null 2>&1; then
        eval "$(direnv hook bash)"
    fi
}

__bash_profile
