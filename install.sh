#!/bin/sh

# Link files from dotfiles
ln -s ~/.dotfiles/bashrc ~/.bashrc
ln -s ~/.dotfiles/inputrc ~/.inputrc
ln -s ~/.dotfiles/gitignore ~/.gitignore
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/offlineimap ~/.offlineimap
ln -s ~/.dotfiles/offlineimaprc ~/.offlineimaprc
ln -s ~/.dotfiles/msmtprc ~/.msmtprc
ln -s ~/.dotfiles/karabiner/karabiner.json ~/.config/karabiner/karabiner.json
ln -s ~/.dotfiles/kwm ~/.kwm
ln -s ~/.dotfiles/khdrc ~/.khdrc
ln -s ~/.dotfiles/hammerspoon ~/.hammerspoon
ln -s ~/.dotfiles/spacemacs.d ~/.spacemacs.d
ln -s ~/.dotfiles/doom.d ~/.doom.d
ln -s ~/.dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -s ~/.dotfiles/nerdbar.widget ~/Library/Application Support/Ubersicht/widgets/nerdbar.widget
ln -s ~/.dotfiles/gnupg ~/.gnupg
ln -s ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/rbenv/default-gems ~/.rbenv/default-gems
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf

# Link .bash_profile -> .bashrc
rm -f ~/.bash_profile
ln -s ~/.bashrc ~/.bash_profile
