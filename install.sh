#!/bin/sh

# Install dotfiles
stow bash
stow alacritty
stow tmux
stow git

# Link files from dotfiles
ln -s ~/.dotfiles/inputrc ~/.inputrc
ln -s ~/.dotfiles/gitignore ~/.gitignore
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/offlineimap ~/.offlineimap
ln -s ~/.dotfiles/offlineimaprc ~/.offlineimaprc
ln -s ~/.dotfiles/msmtprc ~/.msmtprc
ln -s ~/.dotfiles/karabiner/karabiner.json ~/.config/karabiner/karabiner.json
ln -s ~/.dotfiles/hammerspoon ~/.hammerspoon
ln -s ~/.dotfiles/nerdbar.widget ~/Library/Application Support/Ubersicht/widgets/nerdbar.widget
ln -s ~/.dotfiles/gnupg ~/.gnupg

# Link .bash_profile -> .bashrc
rm -f ~/.bash_profile
ln -s ~/.bashrc ~/.bash_profile
