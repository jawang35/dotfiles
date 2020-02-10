#!/usr/bin/env bash

# Bash prompt based on the onehalfdark theme.

__bash_prompt_user_host() {
    printf "%s" \\u

    # Print host if via SSH
    if [ -n "${SSH_CONNECTION-}${SSH_CLIENT-}${SSH_TTY-}" ]; then
        printf "@%s" \\h
    fi
}

__bash_prompt_cwd() {
    local dir_limit="2"
    local truncation="⋯"
    local first_char
    local part_count=0
    local formatted_cwd=""
    local dir_sep="/"
    local tilde="~"

    local cwd="${PWD/#${HOME}/${tilde}}"

    # Get first char of the path, i.e. tilde or slash
    first_char=${cwd::1}

    # Remove leading tilde
    cwd="${cwd#\~}"

    while [[ "${cwd}" == */* && "${cwd}" != "/" ]]; do
        # Pop off last part of cwd
        local part="${cwd##*/}"
        cwd="${cwd%/*}"

        formatted_cwd="${dir_sep}${part}${formatted_cwd}"
        part_count=$((part_count+1))

        [[ ${part_count} -eq ${dir_limit} ]] && first_char="${truncation}" && break
    done

    printf "%s" "${first_char}${formatted_cwd}"
}

__bash_prompt_git_branch() {
    local branch

    if command -v __git_ps1 > /dev/null 2>&1; then
        branch=$(
            GIT_PS1_SHOWDIRTYSTATE=1 \
            GIT_PS1_SHOWUNTRACKEDFILES=1 \
            GIT_PS1_STATESEPARATOR=':' \
            __git_ps1 ' %s'
        )

        if [ -n "${branch}" ]; then
            printf "%s" "${branch}"
            return
        fi
    fi
    return 1
}

__bash_prompt_last_exit_code() {
    [[ ${last_exit_code} -gt 0 ]] || return 1;

    printf "%s" "${last_exit_code}"
}

__bash_prompt_section() {
    # Apply colors $2 to text $1 and wrap with spaces, only if $1 is not empty

    [[ -n "$1" ]] || return 1
    printf "%s" "${2} ${1} "
}

__bash_prompt_ps1() {
    # Empty line
    printf "\n"

    # Section "user_host"
    __bash_prompt_section "$(__bash_prompt_user_host)" "${user_host_color}"

    # Section "cwd"
    __bash_prompt_section "$(__bash_prompt_cwd)" "${cwd_color}"

    # Section "git"
    __bash_prompt_section "$(__bash_prompt_git_branch)" "${git_color}"

    # Section "warn"
    __bash_prompt_section "$(__bash_prompt_last_exit_code)" "${warn_color}"

    # New line
    printf "%s\n" "${reset}"

    # Prompt
    printf "%s${PROMPT_SYMBOL}%s " "${prompt_color}" "${reset}"
}

__bash_prompt() {
    last_exit_code="${PROMPTLINE_LAST_EXIT_CODE:-$?}"
    reset="\[\e[49m\]\[\e[0m\]"

    if [ "${COLORTERM}" = truecolor ] || [ "${COLORTERM}" = 24bit ]; then
        user_host_color="\[\033[38;2;40;44;52m\]\[\033[48;2;97;175;239m\]"
        cwd_color="\[\033[38;2;220;223;228m\]\[\033[48;2;93;103;122m\]"
        git_color="\[\033[38;2;97;175;239m\]\[\033[48;2;49;54;64m\]"
        warn_color="\[\033[38;2;40;44;52m\]\[\033[48;2;229;192;123m\]"
        prompt_color="\[\033[38;2;97;175;239m\]"
    else
        user_host_color="\[\e[38;5;236m\]\[\e[48;5;75m\]"
        cwd_color="\[\e[38;5;255m\]\[\e[48;5;243m\]"
        git_color="\[\e[38;5;75m\]\[\e[48;5;238m\]"
        warn_color="\[\e[38;5;236m\]\[\e[48;5;180m\]"
        prompt_color="\[\e[38;5;75m\]"
    fi

    PS1="$(__bash_prompt_ps1)"
    PS2="${PROMPT_SYMBOL} "
}

if [[ ! "${PROMPT_COMMAND}" == *__bash_prompt* ]]; then
    PROMPT_COMMAND="__bash_prompt; ${PROMPT_COMMAND}"
fi
