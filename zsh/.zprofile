if [[ "$(uname)" = "Darwin" ]]; then
  # Homebrew
  if [ "$(arch)" = "arm64" ] && [[ -d "/opt/homebrew" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    echo "Loaded arm64 macOS Homebrew"
  elif [[ -f "/usr/local/bin/brew" ]]; then
    export PATH=/usr/local/bin:${PATH}
    eval "$(/usr/local/bin/brew shellenv)"
    echo "Loaded amd64 macOS Homebrew"
  else
    echo "WARN: Homebrew not loaded"
  fi

  # OrbStack
  if [[ -d "$HOME/.orbstack" ]]; then
    source ~/.orbstack/shell/init.zsh 2>/dev/null || :
    echo "Loaded OrbStack"
  else
    echo "WARN: OrbStack not loaded"
  fi
fi

if [[ -d "$HOME/.pyenv" ]]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
  echo "Loaded pyenv via $PYENV_ROOT"
else
  echo "WARN: pyenv not loaded"
fi

if [[ -d "$HOME/.cargo" ]]; then
  . "$HOME/.cargo/env" 
  echo "Loaded cargo via $HOME/.cargo"
else
  echo "WARN: cargo not loaded"
fi
