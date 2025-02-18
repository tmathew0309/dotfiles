#!/bin/bash
set -e

echo "Setting up your Zsh environment..."

# Determine the directory of the dotfiles repository
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Install zsh
if ! command -v zsh &> /dev/null; then
    echo "Installing zsh..."
    sudo apt install -y zsh || brew install zsh
fi

backup_and_link() {
  local src=$1
  local dest=$2
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    echo "Backing up existing file: $dest"
    mv "$dest" "${dest}.backup"
  fi
  echo "Linking $src to $dest"
  ln -sf "$src" "$dest"
}

# Create symlinks
backup_and_link "$DOTFILES_DIR/zsh/zshrc" "$HOME/.zshrc"
backup_and_link "$DOTFILES_DIR/zsh/aliases" "$HOME/.aliases"
backup_and_link "$DOTFILES_DIR/git/gitconfig" "$HOME/.gitconfig"

# Install zinit
if [ ! -d "$HOME/.zinit/bin" ]; then
    echo "Installing zinit..."
    mkdir ~/.zinit && git clone https://github.com/zdharma-continuum/zinit.git ~/.zinit/bin
fi

# Reload zsh
echo "Reloading zsh..."
exec zsh