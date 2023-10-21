export XDG_CONFIG_HOME="$HOME/.config"

if [ ! -f ~/.bootstrap_done ]; then
 chmod +x ~/bootstrap.sh
 ~/bootstrap.sh
fi

if [[ "$WSL_DISTRO_NAME" == "Ubuntu" ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git)
source $ZSH/oh-my-zsh.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
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

  # Create a new tmux session if a directory is selected
  if [ -n "$selected_path" ]; then
    local session_name=$(basename "$selected_path")/
    tmux new-session -d -s "$session_name" -c "$selected_path"
    tmux switch-client -n
  fi
}

bindkey -s '^G' 'fuzzy_cd\n'
