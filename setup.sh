#!/usr/bin/env bash

DIR=$(pwd)

echo "source ${DIR}/bash/.profile\nsource ${DIR}/bash/.bashrc" >> ~/.bash_profile

ln -s ${DIR}/atom ${HOME}/.atom
ln -s ${DIR}/bash/.inputrc ${HOME}/.inputrc
ln -s ${DIR}/hammerspoon ${HOME}/.hammerspoon
ln -s ${DIR}/karabiner ${HOME}/.config/karabiner
ln -s ${DIR}/tmux/.tmux.conf ${HOME}/.tmux.conf

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
