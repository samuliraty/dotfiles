# Dotfiles

## Prerequisites

### Windows
Install WSL and configure experimental settings to fix VPN issues.
```ps
wsl --install
Set-Content -Path "~/.wslconfig" -Value "[experimental]`nnetworkingMode=mirrored`ndnsTunneling=true"
wsl
```

### Linux
Run linuxbrew installation and follow the instructions.
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Bootstrap
```bash
git clone https://github.com/samuliraty/dotfiles.git ~/dotfiles && rsync -a ~/dotfiles/ ~/ && rm -rf ~/dotfiles
~/bootstrap.sh
zsh
source ~/.zshrc
```
