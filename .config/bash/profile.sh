#!/usr/bin/env bash

__bash_profile() {
    if [ "${BASH_VERSINFO[0]}" -ge 4 ]; then
        shopt -s autocd direxpand
    fi
    shopt -s cmdhist histappend

    # bash-completion
    if [ -f '/usr/local/etc/profile.d/bash_completion.sh' ]; then
        export BASH_COMPLETION_COMPAT_DIR='/usr/local/etc/bash_completion.d'
        source '/usr/local/etc/profile.d/bash_completion.sh'
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

    # direnv
    if command -v direnv > /dev/null 2>&1; then
        eval "$(direnv hook bash)"
    fi

    # rbenv
    if command -v rbenv > /dev/null 2>&1; then
        eval "$(rbenv init - bash)"
    fi

    # z
    if [ -f '/usr/local/etc/profile.d/z.sh' ]; then
        export _Z_DATA="${HOME}/.local/share/z/data"
        source '/usr/local/etc/profile.d/z.sh'
    fi

    # fzf
    if [ -d '/usr/local/opt/fzf' ]; then
        if [[ ! "${PATH}" == "*/usr/local/opt/fzf/bin*" ]]; then
            export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
        fi

        export FZF_COMPLETION_TRIGGER='**'
        export FZF_DEFAULT_COMMAND='fd --exclude .git --hidden --type f'
        export FZF_DEFAULT_OPTS="
        --height 40%
        --prompt='${PROMPT_SYMBOL} '
        --color=dark
        --color=fg:-1,bg:-1,hl:#98c379,fg+:#dcdfe4,bg+:#313640,hl+:#98c379
        --color=info:#e5c07b,prompt:#61afef,pointer:#e06c75,marker:#c678dd,spinner:#61afef,header:#61afef"
        export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"
        export FZF_CTRL_T_OPTS="--preview='bat {} | head -500'"
        export FZF_CTRL_R_OPTS="--reverse"

        # Setup completions and keybindings for interactive shell
        if [[ $- == *i* ]]; then
            _fzf_allow_no_trigger_completion() {
                local cur="${COMP_WORDS[COMP_CWORD]}"

                if [[ "${cur}" != *"${FZF_COMPLETION_TRIGGER}" ]]; then
                    COMP_WORDS[${COMP_CWORD}]="${cur}${FZF_COMPLETION_TRIGGER}"
                fi
            }

            _fzf_git_branch_completion() {
                _fzf_complete "" "$@" < <(
                    git --no-pager branch --all \
                        | grep -v HEAD \
                        | sed -e 's|remotes/[^/]*/||' -e 's/\*//g' -e 's/ //g' \
                        | sort -u
                )
            }

            _fzf_z_completion() {
                _fzf_allow_no_trigger_completion

                _fzf_complete "" "$@" < <(
                    z | sort --numeric-sort --reverse | awk '{print $NF}' | uniq
                )
            }

            # Advanced customization of options by command
            _fzf_comprun() {
                local COMMAND="${1}"
                shift
                case "${COMMAND}" in
                    cd|gopen|v)  fzf "$@" --preview 'if [ -f {} ]; then bat {} --line-range :500; else tree -C {} | head -200; fi' ;;
                    *)  fzf "$@" ;;
                esac
            }

            # Use fd to generate the list for path completion
            _fzf_compgen_path() {
                fd --exclude .git --hidden --follow . "${1}"
            }

            # Use fd to generate the list for directory completion
            _fzf_compgen_dir() {
                fd --exclude .git --hidden --follow --type d . "${1}"
            }

            source '/usr/local/opt/fzf/shell/completion.bash'
            source '/usr/local/opt/fzf/shell/key-bindings.bash'

            _fzf_setup_completion 'path' gopen v
            _fzf_setup_completion 'git_branch' gco
            _fzf_setup_completion 'z' z
        fi
    fi
}

__bash_profile
unset __bash_profile
