#!/bin/bash

# Function to install Zsh
install_zsh() {
    if [ "$(uname)" = "Darwin" ]; then
        # Install Zsh using Homebrew on macOS
        if ! command -v brew &> /dev/null; then
            echo "Installing Homebrew..."
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        fi
        echo "Installing Zsh using Homebrew..."
        brew install zsh
    elif [ "$(uname)" = "Linux" ]; then
        # Install Zsh using APT on Ubuntu
        echo "Updating packages and installing Zsh using APT..."
        sudo apt update && sudo apt install -y zsh
    else
        echo "Unsupported OS"
        exit 1
    fi
}

install_antidote() {
    ANTIDOTE_DIR="${ZDOTDIR:-$HOME}/.antidote"
    # Check if the Antidote directory already exists
    if [ -d "$ANTIDOTE_DIR" ]; then
        echo "Antidote directory already exists. Pulling the latest changes."
        git -C "$ANTIDOTE_DIR" pull
    else
        echo "Cloning Antidote..."
        git clone --depth=1 https://github.com/mattmc3/antidote.git "$ANTIDOTE_DIR"
    fi
}

echo "Installing zsh..."
install_zsh

echo "Making zsh the default shell..."
chsh -s $(which zsh)

echo "Installing Antidote..."    
install_antidote

echo "Symlinking dotfiles from home directory "
ln -sf $(pwd)/.zshrc $(pwd)/.zsh_plugins.txt $(pwd)/.p10k.zsh $(pwd)/.gitconfig ~/

echo "Loading zsh configuration..."
/bin/zsh -c  "source ~/.zshrc"