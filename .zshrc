export XDG_CONFIG_HOME="$HOME/.config"

if [[ "$WSL_DISTRO_NAME" == "Ubuntu" ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
else
  source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

export ZSH="$HOME/.oh-my-zsh"
source $HOMEBREW_PREFIX/share/powerlevel10k/powerlevel10k.zsh-theme
[ ! -f ~/.p10k.zsh ] || source ~/.p10k.zsh
plugins=(git)
source $ZSH/oh-my-zsh.sh

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^I' autosuggest-accept

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  

fuzzy_cd() {
  local selected_path

  # Only include folders directly under ~/repos and ~/.config
  local prioritized_folders=$(find ~/repos ~/.config -type d -maxdepth 1 -mindepth 1 2> /dev/null)

  # Run fzf
  selected_path=$(echo "$prioritized_folders" | fzf)

  # Create a new iTerm tab if a directory is selected
  if [ -n "$selected_path" ]; then
    osascript \
      -e 'tell application "iTerm" to tell current window to create tab with default profile'

    osascript \
      -e "tell application \"iTerm\" to do script \"cd $selected_path\" in the last session of the current tab of the current window"
  fi
}

bindkey -s '^G' 'fuzzy_cd\n'
