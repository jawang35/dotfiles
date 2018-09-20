#!/usr/bin/env bash

DIR=$(pwd)

echo "source ${DIR}/bash/.profile" >> ${HOME}/.bash_profile
echo "source ${DIR}/bash/.bashrc" >> ${HOME}/.bash_profile

# Symlink dot files
ln -s ${DIR}/atom ${HOME}/.atom
ln -s ${DIR}/bash/.inputrc ${HOME}/.inputrc
ln -s ${DIR}/hammerspoon ${HOME}/.hammerspoon
mkdir -p ${HOME}/.config && ln -s ${DIR}/karabiner ${HOME}/.config/karabiner
ln -s ${DIR}/tmux/.tmux.conf ${HOME}/.tmux.conf

# Vim
if command -v nvim >/dev/null 2>&1;
then
    ln -s ${DIR}/vim ${HOME}/.config/nvim
else
    ln -s ${DIR}/vim ${HOME}/.vim
fi

git submodule update --init --recursive
vim "+PromptlineSnapshot ${HOME}/.shell_prompt.sh airline" +qall
source ${HOME}/.shell_prompt.sh
source ${DIR}/vim/fonts/install.sh
