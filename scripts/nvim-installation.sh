#!/bin/bash
set -e

echo "Installing neovim..."

case "$(uname -s)" in
    Darwin)
        if ! command -v brew >/dev/null 2>&1; then
            echo "Homebrew not found. Install from https://brew.sh/ first."
            exit 1
        fi
        brew install neovim ripgrep
        ;;
    Linux)
        if [ -f /etc/fedora-release ] || command -v dnf >/dev/null 2>&1; then
            sudo dnf install -y neovim ripgrep
        else
            echo "Unsupported Linux distribution. Install neovim and ripgrep manually."
            exit 1
        fi
        ;;
    *)
        echo "Unsupported OS: $(uname -s)"
        exit 1
        ;;
esac

echo "Copying neovim config to ~/.config/nvim..."
mkdir -p "$HOME/.config"
rm -rf "$HOME/.config/nvim"
cp -r nvim "$HOME/.config/nvim"

echo "Restoring plugins from lazy-lock.json..."
nvim --headless "+Lazy! restore" +qa
