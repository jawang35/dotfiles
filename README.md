# dotfiles

Jason's dotfiles.

## Installation

### Requires

- [Git](https://git-scm.com/)
- [Homebrew](https://brew.sh/)

Setup using a Git bare repository (inspired by https://www.atlassian.com/git/tutorials/dotfiles).

```sh
git clone --bare https://github.com/jawang35/.dotfiles.git ${HOME}/.dotfiles.git && git --git-dir=${HOME}/.dotfiles.git --work-tree=${HOME} checkout && ./bootstrap.sh
```

## Configuration Management

`config` is an alias for `git --git-dir=${HOME}/.dotfiles.git --work-tree=${HOME}` and is used to manage the Git bare repository.

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

Applications and packages are managed with the [Brewfile](Brewfile). `Brewfile.local` is optionally loaded to manage local dependencies.

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

## Hyper Key

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
