<a href="https://github.com/jawang35/.dotfiles" title="Jason's dotfiles">
    <img src="https://raw.githubusercontent.com/jglovier/dotfiles-logo/master/dotfiles-logo.svg?sanitize=true" alt="Jason's dotfiles" width="400">
</a>

[![GitHub Actions](https://github.com/jawang35/.dotfiles/workflows/CI/badge.svg)](https://github.com/jawang35/.dotfiles/actions?query=workflow%3ACI)
[![Dependabot](https://api.dependabot.com/badges/status?host=github&repo=jawang35/.dotfiles)](https://app.dependabot.com/)

This is my collection of [dotfiles](https://dotfiles.github.io/). As with any open source software never blindly running anything that has not been properly understood and/or vetted. These settings should be considered unstable as I'm constantly tinkering with them. Rather than installing, I recommend forking and modifying it for your own use or using as a resource for your own configurations.

## Installation

### Requires

- [Git](https://git-scm.com/)
- [Homebrew](https://brew.sh/) - optional

### Bootstrap

```sh
$ curl -s https://raw.githubusercontent.com/jawang35/.dotfiles/master/bootstrap.sh | bash
```

[bootstrap.sh](bootstrap.sh) script will:
1. Clone the repository as a Git bare repository into ~/.dotfiles.
2. Check out configuration files into the `$HOME` directory.
3. Install submodule dependencies.
4. Install [Homebrew](#homebrew) packages and applications.
5. Load [.bash_profile](.bash_profile).

## Configurations

Configuration files are managed using a Git bare repository (inspired by https://www.atlassian.com/git/tutorials/dotfiles). `config` is an alias for `git --git-dir=${HOME}/.dotfiles.git --work-tree=${HOME}` and is used to manage the repository.

To update to latest:

```sh
$ config pull && config checkout && config submodule update --init --recursive
```

- [Bash](https://www.gnu.org/software/bash/) - Default shell. All files found in [.config/bash](.config/bash) are loaded in both login and non-login shells. Local configs added to [.local/bash](.local/bash) will also be loaded. [.config/inputrc](.config/inputrc) improves [Bash](https://www.gnu.org/software/bash/) completion behavior and sets [vi editing mode](https://sanctum.geek.nz/arabesque/vi-mode-in-bash/).
- [Git](https://git-scm.com/) - Version control. Configurations defined in [.config/git](.config/git). Dependencies managed as [submodules](.gitmodules).
- [Hammerspoon](https://www.hammerspoon.org/) - Key bindings for managing Mac OS applications/windows. See [Hammerspoon](#hammerspoon).
- [Homebrew](https://brew.sh/) - Mac OS package manager. [bundler](https://github.com/Homebrew/homebrew-bundle) manages packages [.config/Brewfile](.config/Brewfile). Local package dependencies managed by `.local/Brewfile` if it exists.
- [Karabiner-Elements](https://pqrs.org/osx/karabiner/) - Custom key mappings. Configurations defined in [.config/karabiner](.config/karabiner). Simultaneous `j-k` mapped to `escape`. `capslock` mapped to `cmd+alt+ctrl` to create a ["hyper" key](https://brettterpstra.com/2017/06/15/a-hyper-key-with-karabiner-elements-full-instructions/) for [Hammerspoon](#hammerspoon).
- [kitty](https://sw.kovidgoyal.net/kitty/) - Full-featured GPU-optimized terminal emulator with a readable [configuration file](.config/kitty).
- [lf](https://github.com/gokcehan/lf) - Terminal based file manager. Configurations in [.config/lf](.config/lf).
- [psql](https://www.postgresql.org/docs/current/app-psql.html) - Postgres CLI tool. Configurations at [.psqlrc](.psqlrc).
- [tmux](https://github.com/tmux/tmux) - Manages multiple terminal sessions, windows, and panes. Configured in [.tmux.conf](.tmux.conf).
- [Vim](https://www.vim.org/)/[Neovim](https://neovim.io/) - Configurations setup primarily for [Neovim](https://neovim.io/) at [.config/nvim](.config/nvim). [pathogen.vim](https://github.com/tpope/vim-pathogen) for managing plugins as [submodules](.gitmodule). [.editorconfig](.editorconfig) is used to configure coding styles. Compatibility with [Vim](https://www.vim.org/) is preserved by symlinking [.vim](.vim) and [.config/nvim/vimrc](.config/nvim/vimrc). [Neovim specific plugins](.config/nvim/bundles/nvim) are ignored by vanilla [Vim](https://www.vim.org/).

## Theme

I use the [@sonph](https://github.com/sonph)'s [onehalfdark](https://github.com/sonph/onehalf) theme with [Source Code Pro Nerd Font Mono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/SourceCodePro). My [Bash prompt](.config/bash/prompt) and [tmux status bar](https://github.com/jawang35/.dotfiles/blob/master/.config/tmux/onehalfdark.tmux) have been inspired by the same theme. [24-bit](https://raw.githubusercontent.com/jawang35/.dotfiles/master/.themes/kitty-24-bit.png) and [256-color](https://raw.githubusercontent.com/jawang35/.dotfiles/master/.themes/terminal-8-bit.png) terminal emulators are supported.



[![Kitty (24-bit colors)](.themes/kitty-24-bit.png "Kitty (24-bit colors)")](https://raw.githubusercontent.com/jawang35/.dotfiles/master/.themes/kitty-24-bit.png)

## Hammerspoon

Lua scripts for [Hammerspoon](http://www.hammerspoon.org/) configuration. [.hammerspoon/init.lua](.hammerspoon/init.lua) is the entrypoint that loads all the other modules.

### Hyper Key

`hyper` key is defined as `ctrl+option+cmd`. This is bound to `capslock` using [Karabiner-Elements](.config/karabiner/karabiner.json). `hyper+r` reloads the Hammerspoon config.

### Applications

The following application shortcuts are used:

| Key          | Application   |
|:------------:| ------------- |
| ``hyper+` `` | Kitty         |
| `hyper+1`    | Google Chrome |

#### Application Mode

`hyper+a` opens the application mode. `escape` closes the mode. With the mode open, the following keys launch or switch to the corresponding and close the mode:

| Key       | Application       |
|:---------:| ----------------- |
| `hyper+m` | Messages          |
| `hyper+o` | Microsoft Outlook |
| `hyper+p` | 1Password         |
| `hyper+s` | Slack             |

### Windows

The following window shortcuts are used:

| Key             | Action       |
|:---------------:| ------------ |
| `hyper+f`       | Full Screen  |
| `hyper+c`       | Center       |
| `hyper+h`       | Left Half    |
| `hyper+j`       | Bottom Half  |
| `hyper+k`       | Top Half     |
| `hyper+l`       | Right Half   |
| `hyper+shift+h` | Left Screen  |
| `hyper+shift+j` | Lower Screen |
| `hyper+shift+k` | Upper Screen |
| `hyper+shift+l` | Right Screen |

## License

Copyright (c) 2016 Jason Wang licensed under the [MIT License](LICENSE).
