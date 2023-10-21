#!/bin/bash

echo "🧙 I solemnly swear that I am up to no good. 🪄✨"

if [[ "$WSL_DISTRO_NAME" == "Ubuntu" ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  sudo apt-get install build-essential
  brew install gcc zsh
  chsh -s "$(which zsh)"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --keep-zshrc
fi

brew install powerlevel10k nvm fzf zsh-autosuggestions zsh-syntax-highlighting tmux nvim

touch ~/.bootstrap_done

echo "🧙 Mischief managed. 🪄✨"
