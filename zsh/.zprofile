if [[ -d "/opt/homebrew" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [[ -d "$HOME/.pyenv" ]]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
fi

if [[ -d "$HOME/.orbstack" ]]; then
  source ~/.orbstack/shell/init.zsh 2>/dev/null || :
fi
