# Basic tools
sudo apt update -qy
sudo apt install -qy \
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
sudo apt update -qy
sudo apt install gh -qy

# Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
az bicep install
