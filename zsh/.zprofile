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


# darwin

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


# pyenv

if [[ -d "$HOME/.pyenv" ]]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
  echo "$(__pill_text OK 2) pyenv"
else
  echo "$(__pill_text WARN 3) pyenv not found"
fi


# fnm

if [[ -f /opt/homebrew/bin/fnm ]]; then
  eval "$(fnm env --use-on-cd)"
  echo "$(__pill_text OK 2) fnm"
else
  echo "$(__pill_text WARN 3) fnm not found"
fi


# cargo

if [[ -d "$HOME/.cargo" ]]; then
  . "$HOME/.cargo/env"
  echo "$(__pill_text OK 2) cargo"
else
  echo "$(__pill_text WARN 3) cargo not found"
fi


# private zshrc

if [ -f "$HOME/.private.zshrc" ]; then
  source "$HOME/.private.zshrc"
  echo "$(__pill_text OK 2) private zshrc"
else
  echo "$(__pill_text WARN 3) private zshrc not found"
fi


# keychain

if [[ -d "$HOME/.keychain" ]]; then
  local default_keyfile=$HOME/.ssh/id_ed25519
  local default_keychain_shellenv=$HOME/.keychain/$(hostname)-sh

  if [[ ! -f "$default_keyfile" ]]; then
    echo "$(__pill_text WARN 3) default keyfile not found"
    return
  fi

  if [[ -f "$default_keychain_shellenv" ]]; then
    source "$default_keychain_shellenv"
  fi

  if [[ $(keychain -l | grep $default_keyfile) ]] 2> /dev/null ; then
    echo "$(__pill_text OK 2) default SSH key loaded in keychain"
  else
    echo "$(__pill_text WARN 3) default SSH key not loaded in keychain"
  fi
else
  echo "$(__pill_text WARN 3) keychain not found"
fi
