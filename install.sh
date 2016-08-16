#!/bin/sh

# Link files from dotfiles
ln -s ~/.dotfiles/bashrc ~/.bashrc
ln -s ~/.dotfiles/gitignore ~/.gitignore
ln -s ~/.dotfiles/git-completion.sh ~/.git-completion.sh
ln -s ~/.dotfiles/git-prompt.sh ~/.git-prompt.sh
ln -s ~/.dotfiles/gitignore ~/.gitignore
ln -s ~/.dotfiles/emacs.d ~/.emacs.d

# Link .bash_profile -> .bashrc
rm -f ~/.bash_profile
ln -s ~/.bashrc ~/.bash_profile
