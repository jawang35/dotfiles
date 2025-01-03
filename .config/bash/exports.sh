#!/usr/bin/env bash

__bash_exports() {
    export PROMPT_SYMBOL="❯"

    export PATH="${HOME}/.config/bin:${HOMEBREW_PREFIX}/opt/gnu-sed/libexec/gnubin:${HOMEBREW_PREFIX}/opt/coreutils/libexec/gnubin:$(brew --prefix python)/libexec/bin:${PATH}"
    export MANPATH="${HOMEBREW_PREFIX}/opt/gnu-sed/libexec/gnuman:${HOMEBREW_PREFIX}/opt/coreutils/libexec/gnuman:${MANPATH}"

    # History
    export HISTFILE="${HOME}/.local/share/bash/bash_history"
    export HISTFILESIZE=2000000
    export HISTSIZE=10000
    export HISTCONTROL=ignoreboth:erasedups # ignore duplicate commands and commands starting with spaces
    export HISTIGNORE='z *:cd *:exit:pwd:clear:gopen *:#*'
    export HISTTIMEFORMAT='%F %T '

    __starship_precmd_user_func() {
        # append command, clear, and reload history immediately
        history -n; history -w; history -c; history -r;
    }
    export starship_precmd_user_func="__starship_precmd_user_func"

    # Config file paths
    export CONDARC="${HOME}/.local/conda/condarc"
    export GNUPGHOME="${HOME}/.config/gnupg"
    export HOMEBREW_BUNDLE_FILE="${HOME}/.config/brew/Brewfile"
    export INPUTRC="${HOME}/.config/readline/inputrc"
    export PGPASSFILE="${HOME}/.local/psql/pgpass"
    export PSQLRC="${HOME}/.config/psql/psqlrc"
    export RIPGREP_CONFIG_PATH="${HOME}/.config/ripgrep/ripgreprc"
    export STARSHIP_CONFIG="${HOME}/.config/starship/starship.toml"

    export GIBO_BOILERPLATES="${HOME}/.local/share/gibo/boilerplates"
    export LESSHISTFILE="${HOME}/.local/share/less/lesshst"

    # Set EDITOR variable to Neovim/Vim
    if [ -f "${HOMEBREW_PREFIX}/bin/nvim" ]; then
        export EDITOR="${HOMEBREW_PREFIX}/bin/nvim"
    elif [ -f "${HOMEBREW_PREFIX}/bin/vim" ]; then
        export EDITOR="${HOMEBREW_PREFIX}/bin/vim"
    else
        export EDITOR=/usr/bin/vim
    fi

    export GREP_OPTIONS="--color"

    export LF_ICONS="di=:fi=:ln=:or=:ex=:*.c=:*.cc=:*.clj=:*.coffee=:*.cpp=:*.css=:*.d=:*.dart=:*.erl=:*.exs=:*.fs=:*.go=:*.h=:*.hh=:*.hpp=:*.hs=:*.html=:*.java=:*.jl=:*.js=:*.json=:*.lua=:*.md=:*.php=:*.pl=:*.pro=:*.py=:*.rb=:*.rs=:*.scala=:*.ts=:*.vim=:*.cmd=:*.ps1=:*.sh=:*.bash=:*.zsh=:*.fish=:*.tar=:*.tgz=:*.arc=:*.arj=:*.taz=:*.lha=:*.lz4=:*.lzh=:*.lzma=:*.tlz=:*.txz=:*.tzo=:*.t7z=:*.zip=:*.z=:*.dz=:*.gz=:*.lrz=:*.lz=:*.lzo=:*.xz=:*.zst=:*.tzst=:*.bz2=:*.bz=:*.tbz=:*.tbz2=:*.tz=:*.deb=:*.rpm=:*.jar=:*.war=:*.ear=:*.sar=:*.rar=:*.alz=:*.ace=:*.zoo=:*.cpio=:*.7z=:*.rz=:*.cab=:*.wim=:*.swm=:*.dwm=:*.esd=:*.jpg=:*.jpeg=:*.mjpg=:*.mjpeg=:*.gif=:*.bmp=:*.pbm=:*.pgm=:*.ppm=:*.tga=:*.xbm=:*.xpm=:*.tif=:*.tiff=:*.png=:*.svg=:*.svgz=:*.mng=:*.pcx=:*.mov=:*.mpg=:*.mpeg=:*.m2v=:*.mkv=:*.webm=:*.ogm=:*.mp4=:*.m4v=:*.mp4v=:*.vob=:*.qt=:*.nuv=:*.wmv=:*.asf=:*.rm=:*.rmvb=:*.flc=:*.avi=:*.fli=:*.flv=:*.gl=:*.dl=:*.xcf=:*.xwd=:*.yuv=:*.cgm=:*.emf=:*.ogv=:*.ogx=:*.aac=:*.au=:*.flac=:*.m4a=:*.mid=:*.midi=:*.mka=:*.mp3=:*.mpc=:*.ogg=:*.ra=:*.wav=:*.oga=:*.opus=:*.spx=:*.xspf=:*.pdf="

    export CONDA_DEVENV_ENV_MANAGER=mamba
}

__bash_exports
unset __bash_exports
