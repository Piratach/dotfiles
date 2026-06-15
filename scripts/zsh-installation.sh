#!/bin/bash
set -e

OS="$(uname -s)"

install_pkg() {
    case "$OS" in
        Darwin)
            if ! command -v brew >/dev/null 2>&1; then
                echo "Homebrew not found. Install from https://brew.sh/ first."
                exit 1
            fi
            brew install "$@"
            ;;
        Linux)
            if [ -f /etc/fedora-release ] || command -v dnf >/dev/null 2>&1; then
                sudo dnf install -y "$@"
            else
                echo "Unsupported Linux distribution. Install $* manually."
                exit 1
            fi
            ;;
        *)
            echo "Unsupported OS: $OS"
            exit 1
            ;;
    esac
}

echo "Installing zsh..."
install_pkg zsh
cp zshrc ~/.zshrc
cp aliases.sh ~/.aliases.sh
cp zsh_functions.sh ~/.zsh_functions.sh

echo "Installing oh-my-zsh..."
git clone https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.oh-my-zsh/pure"
git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.oh-my-zsh/plugins/zsh-autosuggestions"

case "$OS" in
    Darwin)
        # macOS ships with zsh as the default shell since Catalina, so chsh
        # is usually a no-op. Use the system zsh path.
        chsh -s /bin/zsh || true
        ;;
    Linux)
        chsh -l /usr/bin/zsh  # change to match local filesystem
        ;;
esac

echo "Installing tmux..."
install_pkg tmux
cp tmux.conf ~/.tmux.conf
cp tmux-status.conf ~/.tmux-status.conf

source ~/.zshrc
