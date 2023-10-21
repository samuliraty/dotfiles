#!/bin/bash

echo "🧙 I solemnly swear that I am up to no good. 🪄✨"

  brew install zsh
  chsh -s "$(which zsh)"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --keep-zshrc
fi

brew install powerlevel10k nvm fzf zsh-autosuggestions zsh-syntax-highlighting tmux nvim

touch ~/.bootstrap_done

echo "🧙 Mischief managed. 🪄✨"
