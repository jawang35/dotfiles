<a href="https://github.com/jawang35/.dotfiles" title="Jason's dotfiles">
    <img src="https://raw.githubusercontent.com/jglovier/dotfiles-logo/master/dotfiles-logo.svg?sanitize=true" alt="Jason's dotfiles" width="400">
</a>

[![](https://github.com/jawang35/.dotfiles/workflows/CI/badge.svg)](https://github.com/jawang35/.dotfiles/actions?query=workflow%3ACI)

This is my collection of configurations. As with any open source software never blindly running anything that has not been properly understood and/or vetted. These settings should be considered unstable as I'm constantly tinkering with them. Rather than installing, I recommend forking and modifying it for your own use or using as a resource for your own configurations.

[![Kitty (24-bit colors)](.themes/kitty-24-bit.png "Kitty (24-bit colors)")](https://raw.githubusercontent.com/jawang35/.dotfiles/master/.themes/kitty-24-bit.png)

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

## Local Configurations

To keep the `$HOME` directory clean, configs are moved into [.config](.config) as much as I can. Secrets and local configurations are loaded from [.local](.local).

- Files in [.local/bash](.local/bash) are sourced from [.bash_profile](.bash_profile).
- [.config/Brewfile](.config/Brewfile) evaluates `.local/Brewfile`.

## Configuration Management

Configuration files are managed using a Git bare repository (inspired by https://www.atlassian.com/git/tutorials/dotfiles). `config` is an alias for `git --git-dir=${HOME}/.dotfiles.git --work-tree=${HOME}` and is used to manage the repository.

To update to latest:

```sh
$ config pull
$ config checkout
```

To update submodule-managed configuration dependencies:

```sh
$ config submodule update --init --recursive
```

## Homebrew

Packages and applications are managed with [.config/Brewfile](.config/Brewfile) using [Homebrew](https://brew.sh/).

To install missing dependencies:

```sh
$ brew bundle
```

To list orphaned dependencies:

```sh
$ brew bundle cleanup # --force to remove
```

## Vim/Neovim

Configurations are optimized for [Neovim](https://neovim.io/), but should be compatible with [Vim](https://www.vim.org/) without any fuss. This is done by symlinking [.vim](.vim) to [.config/nvim](.config/nvim) and [.config/nvim/vimrc](.config/nvim/vimrc) to [.config/nvim/init.vim](.config/nvim/init.vim).

Packages are managed using submodules and installed with [Pathogen](https://github.com/tpope/vim-pathogen). If using [Vim](https://www.vim.org/), [Neovim](https://neovim.io/) specific bundles will not be loaded.

## Hammerspoon

Lua scripts for [Hammerspoon](http://www.hammerspoon.org/) configuration. [.hammerspoon/init.lua](.hammerspoon/init.lua) is the entrypoint that loads all the other modules.

### Hyper Key

`HYPER` key is bound to `CTRL+OPTION+CMD`. This is bound to `CAPSLOCK` using [Karabiner-Elements](.config/karabiner/karabiner.json). `HYPER+R` reloads the Hammerspoon config.


### Applications

The following application shortcuts are used:

| Key          | Application   |
|:------------:| ------------- |
| ``HYPER+` `` | Kitty         |
| `HYPER+1`    | Google Chrome |

#### Application Mode

`HYPER+A` opens the application mode. `ESCAPE` closes the mode. With the mode open, the following keys launch or switch to the corresponding and close the mode:

| Key       | Application       |
|:---------:| ----------------- |
| `HYPER+M` | Messages          |
| `HYPER+O` | Microsoft Outlook |
| `HYPER+P` | 1Password         |
| `HYPER+S` | Slack             |

### Windows

The following window shortcuts are used:

| Key       | Action      |
|:---------:| ----------- |
| `HYPER+F` | Full Screen |
| `HYPER+C` | Center      |

#### Windows Mode

`HYPER+W` opens the window mode. `ESCAPE` closes the mode. With the mode open, the following keys act on the active window:

| Key             | Action       |
|:---------------:| ------------ |
| `HYPER+H`       | Left Half    |
| `HYPER+J`       | Bottom Half  |
| `HYPER+K`       | Top Half     |
| `HYPER+L`       | Right Half   |
| `HYPER+SHIFT+H` | Left Screen  |
| `HYPER+SHIFT+J` | Lower Screen |
| `HYPER+SHIFT+K` | Upper Screen |
| `HYPER+SHIFT+L` | Right Screen |

## License

Copyright (c) 2016 Jason Wang licensed under the [MIT License](LICENSE).
