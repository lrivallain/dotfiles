#!/bin/bash

cd $HOME
echo ".cfg" >> .gitignore
git clone https://github.com/lrivallain/dotfiles.git $HOME/.cfg
alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfg/.git --work-tree=$HOME'
shopt -s expand_aliases
dotfiles config --local status.showUntrackedFiles no
dotfiles checkout -f

bash $HOME/dotfiles-scripts/zsh-setup.sh
bash $HOME/dotfiles-scripts/tools-setup-apt.sh
