#!/bin/bash

echo "🧙 I solemnly swear that I am up to no good. 🪄✨"

if [[ "$WSL_DISTRO_NAME" == "Ubuntu" ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  brew install zsh gcc llvm
  sudo apt-get install build-essential
  echo '/home/linuxbrew/.linuxbrew/bin/zsh' | sudo tee -a /etc/shells
  winusr=$(cmd.exe /c 'echo %USERNAME%' 2>/dev/null | tr -d '\r')
  git config --global credential.helper "/mnt/c/Users/$winusr/AppData/Local/Programs/Git/mingw64/bin/git-credential-manager.exe"
fi


brew install powerlevel10k nvm fzf zsh-autosuggestions zsh-syntax-highlighting tmux nvim lazygit gh
git config --global user.email "32360408+samuliraty@users.noreply.github.com"
git config --global user.name "Samuli Räty"
gh auth login
gh repo clone notes

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc

echo "🧙 Mischief managed. 🪄✨"
