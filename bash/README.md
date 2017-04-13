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

## Promptline

With vim-airline installed, run the following in Vim.

```sh
:PromptlineSnapshot ~/.shell_prompt.sh airline
```

Promptline should run in the shell upon login. Run the following to start Promptline in the current session.

```sh
source ~/.shell_prompt.sh
```
