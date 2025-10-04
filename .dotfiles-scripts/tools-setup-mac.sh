# Basic tools

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Basic packages
brew install zsh
brew install curl
brew install vim
brew install ack
brew install jq
brew install httpie
brew install tmux

brew install mtr
# https://article.masdzub.com/how-to-use-mtr-without-sudo-macos.aspx/
sudo chown root /opt/homebrew/sbin//mtr-packet
sudo chmod 4755 /opt/homebrew/sbin//mtr-packet


brew install docker
brew install signal

# Cask
brew install --cask iterm2
brew install --cask latest
brew install --cask visual-studio-code
brew install --cask bitwarden
brew install --cask whatsapp
brew install --cask spotify
brew install --cask font-fira-code-nerd-font

# Unused yet
# brew install only-switch
# brew install --cask jordanbaird-ice
# brew install --cask alt-tab
# brew install meetingbar

# Github CLI
brew install gh

# Azure CLI
if ! command -v az >/dev/null 2>&1
then
  brew install azure-cli
else
  az upgrade
  az config set auto-upgrade.enable=yes
fi

# UV
if ! command -v uv >/dev/null 2>&1
then
  curl -LsSf https://astral.sh/uv/install.sh | env UV_NO_MODIFY_PATH=1 sh
else
  uv self update
fi

# Terraform
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
