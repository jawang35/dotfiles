# Jason's dotfiles

[![CircleCI](https://circleci.com/gh/jawang35/.dotfiles.svg?style=svg)](https://circleci.com/gh/jawang35/.dotfiles)

## Purpose

This is my collection of configurations. As with any open source software I don't recommend blindly running anything that has not been properly understood and/or vetted. These settings should be considered unstable and constantly changing. Rather than installing as is, I recommend forking and modifying it for your own use or using as a resource for your own configurations.

## Installation

### Requires

- [Git](https://git-scm.com/)
- [Homebrew](https://brew.sh/) - optional

```sh
curl -s https://raw.githubusercontent.com/jawang35/.dotfiles/master/bootstrap.sh | bash
```

[bootstrap.sh](bootstrap.sh) script will:
1. Clone the repository as a Git bare repository into ~/.dotfiles.
2. Check out configuration files into the `$HOME` directory.
3. Install submodule dependencies.
4. Install [Homebrew](#homebrew) packages and applications.
5. Load [.bash_profile](.bash_profile).

## Configuration Management

Configuration files are managed using a Git bare repository (inspired by https://www.atlassian.com/git/tutorials/dotfiles). `config` is an alias for `git --git-dir=${HOME}/.dotfiles.git --work-tree=${HOME}` and is used to manage the repository.

To update to latest:

```sh
$ config pull
$ config checkout
```

To update submodule-managed configuration dependencies, including [Vim](https://www.vim.org/)/[Neovim](https://neovim.io/) packages installed with [pathogen](https://github.com/tpope/vim-pathogen):

```sh
$ config submodule update --init --recursive
```

## Homebrew

Packages and applications are managed with the [Brewfile](Brewfile) using [Homebrew](https://brew.sh/). `Brewfile.local` is optionally loaded to manage local dependencies.

To install missing dependencies:

```sh
$ brew bundle
```

To list orphaned dependencies:

```sh
$ brew bundle cleanup # --force to remove
```

## Colors

[onehalf](https://github.com/sonph/onehalf) colors are used for Terminal.app and [Vim](https://www.vim.org/)/[Neovim](https://neovim.io/). [Bash prompt](.bash_prompt) and [tmux prompt](.tmux.conf) have also been configured to use a similar color scheme. This is a 256 color scheme and does not require 24-bit or TrueColor terminal applications.

Opening [OneHalfDark.terminal](https://github.com/sonph/onehalf/blob/master/terminal/OneHalfDark.terminal) loads the `OneHalfDark` profile in Terminal.app. To use this color scheme set this as your default profile. I also recommend using [Source Code Pro](http://adobe-fonts.github.io/source-code-pro/) 14pt font, which should have been installed with [Homebrew](#homebrew).

## Hammerspoon

Lua scripts for [Hammerspoon](http://www.hammerspoon.org/) configuration. `init.lua` is the entrypoint that loads all the other modules.

### Hyper Key

`HYPER` key is bound to `CTRL+OPTION+CMD`. This is bound to `CAPSLOCK` using [Karabiner-Elements](.config/karabiner/karabiner.json).

### Applications

The following application shortcuts are used:

| Key          | Application   |
|:------------:| ------------- |
| ``HYPER+` `` | Terminal      |
| `HYPER+1`    | Google Chrome |

#### Application Mode

`HYPER+A` opens the application modal. `ESCAPE` closes the application modal. With the application modal open, the following keys launch or switch to the corresponding applications and close the application modal:

| Key       | Application       |
|:---------:| ----------------- |
| `HYPER+M` | Messages          |
| `HYPER+O` | Microsoft Outlook |
| `HYPER+P` | 1Password         |
| `HYPER+S` | Slack             |

### Reload Config

`HYPER+R` reloads the Hammerspoon config.

### Windows

The following keys act on the active window:

| Key             | Action       |
|:---------------:| ------------ |
| `HYPER+F`       | Full Screen  |
| `HYPER+C`       | Center       |
| `HYPER+H`       | Left Half    |
| `HYPER+J`       | Bottom Half  |
| `HYPER+K`       | Top Half     |
| `HYPER+L`       | Right Half   |
| `HYPER+SHIFT+H` | Left Screen  |
| `HYPER+SHIFT+J` | Lower Screen |
| `HYPER+SHIFT+K` | Upper Screen |
| `HYPER+SHIFT+L` | Right Screen |

## License

Copyright (c) 2018 Jason Wang
Licensed under the [MIT License](LICENSE).
