#!/bin/bash

# For Fedora

echo "Installing zsh..."
sudo dnf install zsh
cp zshrc ~/.zshrc
cp aliases.sh ~/.aliases.sh
cp zsh_functions.sh ~/.zsh_functions.sh
echo "Installing oh-my-zsh..."
git clone https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.oh-my-zsh/pure"
git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.oh-my-zsh/plugins/zsh-autosuggestions"
chsh -l /usr/bin/zsh  # change to match local filesystem
echo "Installing tmux..."
sudo dnf install tmux
cp tmux.conf ~/.tmux.conf
cp tmux-status.conf ~/.tmux-status.conf

source ~/.zshrc
