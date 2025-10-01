#!/bin/bash

cd $HOME
mkdir -p .ssh

alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfg/.git --work-tree=$HOME'
shopt -s expand_aliases

if [[ -d $HOME/.cfg/.git ]]
then
  echo "Already installed: lets update it"
  dotfiles pull --quiet
else
  echo ".cfg" >> .gitignore
  git clone https://github.com/lrivallain/dotfiles.git $HOME/.cfg --quiet
  dotfiles config --local status.showUntrackedFiles no
  dotfiles checkout -f --quiet
fi

OS_TYPE="$(uname)"
if [[ "$OS_TYPE" == "Linux" ]]; then
    echo "Running on Linux"
    if command -v apt >/dev/null 2>&1; then
      bash $HOME/.dotfiles-scripts/tools-setup-apt.sh
  else
      echo "apt is NOT available: leaving"
      exit 2
  fi
elif [[ "$OS_TYPE" == "Darwin" ]]; then
    echo "Running on macOS"
    bash $HOME/.dotfiles-scripts/tools-setup-mac.sh
else
    echo "Unknown OS: $OS_TYPE"
    exit 1
fi

bash $HOME/.dotfiles-scripts/zsh-setup.sh