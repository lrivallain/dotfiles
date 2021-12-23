#!/bin/bash

# Ensure to have zsh installed
sudo apt update -qy
sudo apt install zsh -qy


export ZSH_CUSTOM=~/.oh-my-zsh/custom

if [[ -d $ZSH_CUSTOM ]]
then
  echo "Oh My ZSH is already installed"
else
  echo "Oh My ZSH..."
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo "Oh My ZSH plugins..."
omz_plugins=("zsh-autosuggestions" "zsh-completions" "zsh-syntax-highlighting")
for plugin in ${omz_plugins[@]}; do
  if [[ -d ${ZSH_CUSTOM}/plugins/${plugin} ]]
  then
    git -C ${ZSH_CUSTOM}/plugins/${plugin} pull
  else
    git clone --quiet https://github.com/zsh-users/${plugin} ${ZSH_CUSTOM}/plugins/${plugin}
  fi
done

echo "Powerlevel10k theme..."
if [[ -d ${ZSH_CUSTOM}/themes/powerlevel10k ]] 
then
  git -C ${ZSH_CUSTOM}/themes/powerlevel10k pull 
else
  git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM}/themes/powerlevel10k
fi

# If custom zshrc file was moved by ohmyzsh, replace it 
if [[ -f ${HOME}/.zshrc.pre-oh-my-zsh ]]
then
  mv ${HOME}/.zshrc.pre-oh-my-zsh ${HOME}/.zshrc
fi

# Change shell
echo "Force current user shell to be zsh"
sudo chsh -s $(which zsh) $USER
