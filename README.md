# My dotfiles

> Inspiration from ackama: https://www.ackama.com/what-we-think/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained/

## Doftiles installation

```bash
cd $HOME
echo ".cfg" >> .gitignore
git clone git@github.com:lrivallain/dotfiles.git $HOME/.cfg
alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfg/.git --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
dotfiles checkout
```

(may have to force the checkout by using `-f` with the checkout command)

## Setup ZSH

To setup ZSH, run the following script:

```bash
bash zsh-setup.sh
```

## **(do not run)** How was it made the first time?
> This part was used only to init the repository with its content: it is not necessary to re-use it.

```bash
git init --bare $HOME/.cfg
alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfg/.git/ --work-tree=$HOME'
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfg/.git/ --work-tree=$HOME'" >> $HOME/.zsh/aliases
dotfiles config --local status.showUntrackedFiles no
dotfiles remote add origin git@github.com:lrivallain/dotfiles.git

# add a file
dotfiles add .vimrc
dotfiles commit -m "add .vimrc"
dotfiles push
```

