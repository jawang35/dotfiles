# dotfiles

Jason's dotfiles.

## Quick Start

Setup using a git bare repository inspired by https://www.atlassian.com/git/tutorials/dotfiles.

```sh
git clone --bare git@github.com:jawang35/.dotfiles.git ${HOME}/.dotfiles.git && git --git-dir=${HOME}/.dotfiles.git --work-tree=${HOME} checkout && source ${HOME}/.bash_profile && df submodule update --init --recursive
```
