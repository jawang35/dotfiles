<a href="https://github.com/jawang35/dotfiles" title="Jason's dotfiles">
    <img src="https://raw.githubusercontent.com/jglovier/dotfiles-logo/main/dotfiles-logo.svg?sanitize=true" alt="Jason's dotfiles" width="400">
</a>

[![License](https://img.shields.io/github/license/jawang35/dotfiles?color=informational)](https://github.com/jawang35/dotfiles/blob/master/LICENSE)
[![GitHub Workflow](https://img.shields.io/github/workflow/status/jawang35/dotfiles/CI?logo=github)](https://github.com/jawang35/dotfiles/actions?query=workflow%3ACI)

This is my collection of [dotfiles](https://dotfiles.github.io/). As with any open source software never blindly running anything that has not been properly understood and/or vetted. These settings should be considered unstable as I'm constantly tinkering with them. Rather than installing, I recommend forking and modifying it for your own use or using as a resource for your own configurations.

## Installation

### Requires

- [Git](https://git-scm.com/)
- [Homebrew](https://brew.sh/) - optional

### Bootstrap

```sh
curl -s https://raw.githubusercontent.com/jawang35/dotfiles/master/bootstrap.sh | bash
```

[bootstrap.sh](bootstrap.sh) script will:
1. Clone the repository as a Git bare repository into ~/.dotfiles.
2. Check out configuration files into the `$HOME` directory.
3. Install submodule dependencies.
4. Install [Homebrew](#homebrew) packages and applications.
5. Load [.bash_profile](.bash_profile).

## Configurations

Configuration files are managed using a Git bare repository (inspired by https://www.atlassian.com/git/tutorials/dotfiles). `config` is an alias for `git --git-dir=${HOME}/.dotfiles.git --work-tree=${HOME}` and is used to manage the repository.

To keep the `$HOME` directory clean, configurations are stored in [.config](.config) when possible. Local configurations and secrets are sourced from [.local](.local).

To update to latest:

```sh
config update all
```

- [Bash](https://www.gnu.org/software/bash/) - Default shell. All files found in [.config/bash](.config/bash) are loaded in both login and non-login shells. Local configs added to [.local/bash](.local/bash) will also be loaded. [.config/inputrc](.config/inputrc) improves [Bash](https://www.gnu.org/software/bash/) completion behavior and sets [vi editing mode](https://sanctum.geek.nz/arabesque/vi-mode-in-bash/).
- [Git](https://git-scm.com/) - Version control. Configurations defined in [.config/git](.config/git). Dependencies managed as [submodules](.gitmodules).
- [Hammerspoon](https://www.hammerspoon.org/) - Key bindings for managing macOS applications/windows. See [Hammerspoon](#hammerspoon).
- [Homebrew](https://brew.sh/) - macOS package manager. [bundler](https://github.com/Homebrew/homebrew-bundle) manages packages [.config/Brewfile](.config/Brewfile). Local package dependencies managed by `.local/Brewfile` if it exists.
- [Karabiner-Elements](https://pqrs.org/osx/karabiner/) - Custom key mappings for macOS. See [Karabiner-Elements](#karabiner-elements).
- [kitty](https://sw.kovidgoyal.net/kitty/) - Full-featured GPU-optimized terminal emulator with a readable [configuration file](.config/kitty).
- [tmux](https://github.com/tmux/tmux) - Manages multiple terminal sessions, windows, and panes. Configured in [.config/tmux/tmux.conf](.config/tmux/tmux.conf).
- [Vim](https://www.vim.org/)/[Neovim](https://neovim.io/) - Configurations setup primarily for [Neovim](https://neovim.io/) at [.config/nvim](.config/nvim). Compatibility with [Vim](https://www.vim.org/) is preserved by symlinking [.vim](.vim) and [.config/nvim/vimrc](.config/nvim/vimrc), and by ignoring [Neovim specific plugins](.config/nvim/bundles/nvim).

## Theme

I use the [@sonph](https://github.com/sonph)'s [onehalfdark](https://github.com/sonph/onehalf) theme with [Source Code Pro Nerd Font Mono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/SourceCodePro). My [tmux status bar](.config/tmux/status-bar.sh) has been inspired by the same theme. [24-bit](https://res.cloudinary.com/jawang35/image/upload/kitty-24-bit.png) and [256-color](https://res.cloudinary.com/jawang35/image/upload/terminal-256-color.png) terminal emulators are supported.

[![Kitty (24-bit colors)](https://res.cloudinary.com/jawang35/image/upload/kitty-24-bit.png "Kitty (24-bit colors)")](https://res.cloudinary.com/jawang35/image/upload/kitty-24-bit.png)

## Karabiner-Elements

Custom [Karabiner-Elements](https://pqrs.org/osx/karabiner/) key bindings configured in [.config/karabiner](.config/karabiner) on macOS:

- <kbd>Ctrl</kbd> (or <kbd>Fn</kbd>) with <kbd>h</kbd>, <kbd>j</kbd>, <kbd>k</kbd>, <kbd>l</kbd> for vi-like arrow movement.
- Simultaneous <kbd>j</kbd>+<kbd>k</kbd> to escape.  <kbd>⇪ Caps Lock</kbd> bound to <kbd>Ctrl</kbd>+<kbd>⌥</kbd>+<kbd>⌘</kbd> to create a <kbd>Hyper</kbd> key for use with [Hammerspoon](#hammerspoon).
- <kbd>Ctrl</kbd>+<kbd>Delete</kbd> mimics <kbd>Fn</kbd>+<kbd>Delete</kbd> (delete forward).
- Ducky (One 2/Mecha) Mini mappings to match Mac keyboard layout. VID/PID changed to work with macOS (https://twitter.com/i/status/1159519887527727106).

## Hammerspoon

Lua scripts for [Hammerspoon](http://www.hammerspoon.org/) configuration. [.hammerspoon/init.lua](.hammerspoon/init.lua) is the entrypoint that loads all the other modules.

<kbd>Hyper</kbd> key is defined as <kbd>Ctrl</kbd>+<kbd>⌥</kbd>+<kbd>⌘</kbd> and is bound to <kbd>⇪ Caps Lock</kbd> using [Karabiner-Elements](#karabiner-elements). <kbd>Hyper</kbd>+<kbd>r</kbd> reloads the Hammerspoon config.

### Applications

The following application shortcuts are used:

| Keys                           | Application   |
|:------------------------------:| ------------- |
| <kbd>Hyper</kbd>+<kbd>\`</kbd> | Kitty         |
| <kbd>Hyper</kbd>+<kbd>1</kbd>  | Google Chrome |

#### Application Mode

<kbd>Hyper</kbd>+<kbd>a</kbd> opens the application mode. <kbd>Esc</kbd> closes the mode. With the mode open, the following keys launch or switch to the corresponding and close the mode:

| Keys                          | Application       |
|:-----------------------------:| ----------------- |
| <kbd>Hyper</kbd>+<kbd>m</kbd> | Messages          |
| <kbd>Hyper</kbd>+<kbd>o</kbd> | Microsoft Outlook |
| <kbd>Hyper</kbd>+<kbd>p</kbd> | 1Password         |
| <kbd>Hyper</kbd>+<kbd>s</kbd> | Slack             |

### Window Management

The following window shortcuts are used:

| Keys                                       | Action       |
|:------------------------------------------:| ------------ |
| <kbd>Hyper</kbd>+<kbd>f</kbd>              | Full Screen  |
| <kbd>Hyper</kbd>+<kbd>c</kbd>              | Center       |
| <kbd>Hyper</kbd>+<kbd>h</kbd>              | Left Half    |
| <kbd>Hyper</kbd>+<kbd>j</kbd>              | Bottom Half  |
| <kbd>Hyper</kbd>+<kbd>k</kbd>              | Top Half     |
| <kbd>Hyper</kbd>+<kbd>l</kbd>              | Right Half   |
| <kbd>Hyper</kbd>+<kbd>⇧</kbd>+<kbd>h</kbd> | Left Screen  |
| <kbd>Hyper</kbd>+<kbd>⇧</kbd>+<kbd>j</kbd> | Lower Screen |
| <kbd>Hyper</kbd>+<kbd>⇧</kbd>+<kbd>k</kbd> | Upper Screen |
| <kbd>Hyper</kbd>+<kbd>⇧</kbd>+<kbd>l</kbd> | Right Screen |

## License

© 2016 Jason Wang licensed under the [MIT License](LICENSE).
