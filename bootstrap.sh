#!/bin/bash

echo "🧙 I solemnly swear that I am up to no good. 🪄✨"

if [[ "$WSL_DISTRO_NAME" == "Ubuntu" ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  sudo apt-get install build-essential
  brew install zsh gcc
  gcc_version=$(ls /home/linuxbrew/.linuxbrew/bin | grep -E ^gcc-[0-9]+$ | sort -V | tail -n1)
  ln -s "/home/linuxbrew/.linuxbrew/bin/$gcc_version" "/home/linuxbrew/.linuxbrew/bin/gcc"
  echo '/home/linuxbrew/.linuxbrew/bin/zsh' | sudo tee -a /etc/shells
fi

brew install powerlevel10k nvm fzf zsh-autosuggestions zsh-syntax-highlighting tmux nvim lazygit gh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc

echo "🧙 Mischief managed. 🪄✨"
