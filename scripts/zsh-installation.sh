#!/bin/bash

# TODO: have a flag that checks whether or not we're on arch

echo "Installing zsh..."
sudo pacman -S zsh
cp zshrc ~/.zshrc
cp aliases.sh ~/.aliases.sh
cp zsh_functions.sh ~/.zsh_functions.sh
echo "Installing oh-my-zsh..."
yay -S oh-my-zsh
chsh -l /usr/bin/zsh  # change to match local filesystem
echo "Installing tmux..."
sudo pacman -S tmux
cp tmux.conf ~/.tmux.conf
cp tmux-status.conf ~/.tmux-status.conf

source ~/.zshrc
