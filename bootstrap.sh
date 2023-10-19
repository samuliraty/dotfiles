#!/bin/bash

echo "🧙 I solemnly swear that I am up to no good. 🪄✨"

# Install Homebrew, Zsh, and set as default shell if not on macOS
if [[ "$(uname)" != "Darwin" ]]; then
  if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(brew --prefix)/bin/brew shellenv"
    ln -s /home/linuxbrew/.linuxbrew/bin/brew /usr/local/bin/brew
  fi

  if ! command -v zsh &> /dev/null; then
    brew install zsh
    chsh -s "$(which zsh)"
  fi
fi

# Install packages via Homebrew
brew install powerlevel10k nvm fzf zsh-autosuggestions zsh-syntax-highlighting tmux nvim

# Create a marker file
touch ~/.bootstrap_done

echo "🧙 Mischief managed. 🪄✨"
