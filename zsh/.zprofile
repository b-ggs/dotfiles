# functions

__pill_text() {
    local text="$1"
    local color="$2"

    local foreground_color_start="\033[38;5;${color}m"
    local background_color_start="\033[48;5;${color}m"
    local reset_color="\033[0m"
    local black_text_color="\033[30m"

    local pill_start="${foreground_color_start}${reset_color}"
    local pill_end="${foreground_color_start}${reset_color}"

    echo -e "${pill_start}${background_color_start}${black_text_color}${text}${reset_color}${pill_end}"
}

# shell stuff

if [[ "$(uname)" = "Darwin" ]]; then
  # Homebrew
  if [ "$(arch)" = "arm64" ] && [[ -d "/opt/homebrew" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    echo "$(__pill_text OK 2) arm64 Homebrew"
  elif [[ -f "/usr/local/bin/brew" ]]; then
    export PATH=/usr/local/bin:${PATH}
    eval "$(/usr/local/bin/brew shellenv)"
    echo "$(__pill_text OK 2) amd64 Homebrew"
  else
    echo "$(__pill_text WARN 3) On Darwin but Homebrew not found"
  fi

  # OrbStack
  if [[ -d "$HOME/.orbstack" ]]; then
    source ~/.orbstack/shell/init.zsh 2>/dev/null || :
    echo "$(__pill_text OK 2) OrbStack"
  else
    echo "$(__pill_text WARN 3) On Darwin but OrbStack not found"
  fi
fi

if [[ -d "$HOME/.pyenv" ]]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
  echo "$(__pill_text OK 2) pyenv"
else
  echo "$(__pill_text WARN 3) pyenv not found"
fi

if [[ -d "$HOME/.cargo" ]]; then
  . "$HOME/.cargo/env" 
  echo "$(__pill_text OK 2) cargo"
else
  echo "$(__pill_text WARN 3) cargo not found"
fi
