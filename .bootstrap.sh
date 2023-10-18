#!/bin/bash

echo "🧙 I solemnly swear that I am up to no good. 🪄✨"

# Install Homebrew if not on macOS and if Homebrew is not already installed
if [[ "$(uname)" != "Darwin" ]]; then
  if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "eval \$($(brew --prefix)/bin/brew shellenv)" >> "$HOME/.zshrc"
    eval "$(brew --prefix)/bin/brew shellenv"
  fi
fi

# Install packages via Homebrew
brew install powerlevel10k nvm fzf zsh-autosuggestions zsh-syntax-highlighting tmux nvim

# Create a marker file
touch ~/.bootstrap_done

echo "🧙 Mischief managed. 🪄✨"
