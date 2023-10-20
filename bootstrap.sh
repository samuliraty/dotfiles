#!/bin/bash

echo "🧙 I solemnly swear that I am up to no good. 🪄✨"

if [[ -n "$WSL_DISTRO_NAME" ]]; then
  brew install zsh
  chsh -s "$(which zsh)"

fi

brew install powerlevel10k nvm fzf zsh-autosuggestions zsh-syntax-highlighting tmux nvim

touch ~/.bootstrap_done

echo "🧙 Mischief managed. 🪄✨"
