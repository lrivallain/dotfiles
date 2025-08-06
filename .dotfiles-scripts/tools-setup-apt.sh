# Basic tools
sudo apt update -qqy
sudo apt install -qqy \
  zsh \
  vim \
  curl \
  python3 \
  zsh \
  ack \
  jq \
  httpie \
  tmux

# Github CLI
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update -qqy
sudo apt install gh -qqy

# Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
az bicep install

# Former pyenv is now replaced by UV
## Pyenv
#curl https://pyenv.run | bash

# UV
curl -LsSf https://astral.sh/uv/install.sh | sh
