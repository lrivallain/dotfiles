#!/bin/bash

cd $HOME

alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfg/.git --work-tree=$HOME'
shopt -s expand_aliases

if [[ -d $HOME/.cfg/.git ]]
then
  echo "Already installed: lets update it"
  dotfiles pull
else
  echo ".cfg" >> .gitignore
  git clone https://github.com/lrivallain/dotfiles.git $HOME/.cfg
  dotfiles config --local status.showUntrackedFiles no
  dotfiles checkout -f
fi

bash $HOME/dotfiles-scripts/zsh-setup.sh
bash $HOME/dotfiles-scripts/tools-setup-apt.sh
