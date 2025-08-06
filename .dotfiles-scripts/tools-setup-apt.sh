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
if ! command -v az >/dev/null 2>&1
then
  curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
  az bicep install
  az config set auto-upgrade.enable=yes
else
  az upgrade
  az config set auto-upgrade.enable=yes
fi

# UV
if ! command -v uv >/dev/null 2>&1
  curl -LsSf https://astral.sh/uv/install.sh | env UV_NO_MODIFY_PATH=1 sh
else
  uv self update
fi
