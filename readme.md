# Dotfiles

## Prerequisites

### Windows
Install WSL and configure experimental settings to fix VPN issues.
```ps
Set-Content -Path "~/.wslconfig" -Value "[experimental]`nnetworkingMode=mirrored`ndnsTunneling=true"
wsl --install
```

## Bootstrap
```bash
git clone https://github.com/samuliraty/dotfiles.git ~/dotfiles && rsync -a ~/dotfiles/ ~/ && rm -rf ~/dotfiles
~/bootstrap.sh
zsh
source ~/.zshrc
```
