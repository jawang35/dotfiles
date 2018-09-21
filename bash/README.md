# Bash

Configurations for Bash shell defaults.

## Usage

```sh
# ~/.bash_profile
source ${HOME}/.profile
source /path/to/dotfiles/bash/.profile
source ${HOME}/.bashrc
source /path/to/dotfiles/bash/.bashrc
```

```sh
$ ln -s /path/to/dotfiles/bash/.inputrc ${HOME}/.inputrc
```

## Promptline

With vim-airline installed, run the following.

```sh
$ vim "+PromptlineSnapshot ${HOME}/.shell_prompt.sh airline" +qall
$ source ${HOME}/.shell_prompt.sh
```
