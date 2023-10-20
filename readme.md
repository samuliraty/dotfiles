# Dotfiles

```
git clone https://github.com/samuliraty/dotfiles.git ~/dotfiles && rsync -a ~/dotfiles/ ~/ && rm -rf ~/dotfiles
```

## Windows setup
Add experimental WSL features to fix VPN issues.
```
Set-Content -Path "~/.wslconfig" -Value "[experimental]`nnetworkingMode=mirrored`ndnsTunneling=true"
```

## WSL setup
Run the linuxbrew installation and follow the instructions.
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Bootstrap
```
~/bootstrap.sh
```
