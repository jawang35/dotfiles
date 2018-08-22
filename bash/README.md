# Bash

Configurations for Bash shell defaults.

## Usage

```sh
# ~/.bash_profile
source $HOME/.profile
source /path/to/dotfiles/bash/.profile
source $HOME/.bashrc
source /path/to/dotfiles/bash/.bashrc
```

```sh
# Bash
$ ln -s /path/to/dotfiles/bash/.inputrc $HOME/.inputrc
```

## Promptline

With vim-airline installed, run the following.

```sh
# Vim ex
:PromptlineSnapshot ~/.shell_prompt.sh airline

# Bash
$ source ~/.shell_prompt.sh
```
