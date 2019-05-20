if [[ -f "$HOME/.fzf.zsh" ]]; then
  # Change default fzf command to use ag
  export FZF_DEFAULT_COMMAND='ag --hidden --nocolor --ignore node_modules --ignore .git -g ""'
  # Use 16-color colorscheme
  export FZF_DEFAULT_OPTS="--color 16"
  # Source fzf zsh configs
  source "$HOME/.fzf.zsh"
fi
