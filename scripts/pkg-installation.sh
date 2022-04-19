#!/bin/bash

echo "Enter password once and follow prompts."

# OS
sudo pacman -S timeshift # for snapshots backup

# Desktop
sudo pacman -S polybar
sudo pacman -S rofi
sudo pacman -S nemo
sudo pacman -S feh
sudo pacman -S gthumb

# Development
sudo pacman -S rxvt-unicode # urxvt

sudo pacman -S zathura
sudo pacman -S python

# Browsers
sudo pacman -S firefox
sudo pacman -S vivaldi

# Entertainment
sudo pacman -S vlc
sudo pacman -S simplescreenrecorder
sudo pacman -S steam
sudo pacman -S avidemux-qt
sudo pacman -S lollypop

## AUR Packages ##

# AUR installer
sudo pacman -S yay

# Zoom (or try pamac)
yay -S zoom

# betterlockscreen (alternative to i3-lock)
yay -S betterlockscreen

# Spotify
yay -S spotify

# Input Remapper (for mouse)
yay -S input-remapper-git

# Slack
yay -S slack

# oh-my-zsh
yay -S oh-my-zsh
