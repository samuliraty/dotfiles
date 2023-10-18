export XDG_CONFIG_HOME="$HOME/.config"

if [ ! -f ~/.bootstrap_done ]; then
 chmod +x ~/bootstrap.sh
 ~/bootstrap.sh
fi

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git)
source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /Users/samuliraty/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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

  # Open in a new tmux session if a directory is selected
  if [ -n "$selected_path" ]; then
    tmux new-session -c "$selected_path"
  fi
}

bindkey -s '^G' 'fuzzy_cd\n'
