# binds

# use emacs mode i think???
# https://unix.stackexchange.com/a/197841
bindkey -e
bindkey "^P" history-beginning-search-backward
bindkey "^N" history-beginning-search-forward


# env

export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

export LANG="en_US.UTF-8"
export SHELL="$(which zsh)"

if [[ -n "$(command -v nvim 2> /dev/null)" ]]; then
  export EDITOR="nvim"
elif [[ -n "$(command -v vim 2> /dev/null)" ]]; then
  export EDITOR="vim"
else
  export EDITOR="vi"
fi

export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

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

__print_and_execute() {
  echo "$@" >&2
  "$@"
}


listwatch() {
  while true; do
    "${@:2}";
    sleep $1;
  done
}




# aliases

if [[ "$(uname)" == "Darwin" ]]; then
  alias lock='__print_and_execute open -a ScreenSaverEngine'
  alias hidedesktop='__print_and_execute defaults write com.apple.finder CreateDesktop false && killall Finder'
  alias showdesktop='__print_and_execute defaults write com.apple.finder CreateDesktop true && killall Finder'
  alias resetdock='__print_and_execute defaults write com.apple.dock tilesize -int 32; killall Dock'
  alias flushdnscache='__print_and_execute sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'
  alias powermetricsthermal='__print_and_execute sudo powermetrics -s thermal'
  alias chargerwatts='__print_and_execute ioreg -r -c AppleSmartBattery | grep -i "AppleRawAdapterDetails" | sed "s/.*\"Watts\"=\([0-9]*\).*/\1/" | xargs echo -n'
elif [[ "$(uname)" == "Linux" ]]; then
  alias lock='__print_and_execute i3lock'
fi

alias poi='__print_and_execute poetry sync'
alias pos='__print_and_execute eval $(poetry env activate)'
alias popreferactive='__print_and_execute poetry config virtualenvs.prefer-active-python true'

povenvpath() {
  poetry env info | awk '/^Path:/{print $2; exit}'
}

podestroyvenv() {
  deactivate 2> /dev/null
  local venvpath=$(povenvpath)
  if [[ -n "$venvpath" ]]; then
    rm -rf "$venvpath"
  else
    echo "No venv found" >&2
  fi
}

alias van='__print_and_execute python3 -m venv .venv'
alias vac='__print_and_execute source .venv/bin/activate'
alias vad='__print_and_execute deactivate'

alias home='__print_and_execute cd $HOME'
alias dev='__print_and_execute cd $HOME/dev'
alias b-ggs='__print_and_execute cd $HOME/dev/b-ggs'
alias dotfiles='__print_and_execute cd $HOME/.files'
alias dotfilesprivate='__print_and_execute cd $HOME/.files-private'
alias dump='__print_and_execute mkdir -p $HOME/.dump && cd $HOME/.dump'
alias dotbin='__print_and_execute cd $HOME/.bin'
alias Downloads='__print_and_execute cd $HOME/Downloads'
alias Desktop='__print_and_execute cd $HOME/Desktop'

alias known-hosts='__print_and_execute $EDITOR $HOME/.ssh/known_hosts'
alias ssh-config='__print_and_execute cd $HOME/.ssh-config'
alias authorized-keys='__print_and_execute cd $HOME/.authorized-keys'

alias sshforward='__print_and_execute ssh -L 8000:localhost:8000 -L 8143:localhost:8143 -L 8823:localhost:8823 -L 5678:localhost:5678 -L 3000:localhost:3000 -L 8086:localhost:8086 -L 5432:localhost:5432 -L 8080:localhost:8080 -L 8082:localhost:8082 -L 8001:localhost:8001 -CNT '

alias keychainloaddefault='__print_and_execute keychain --nogui -q $HOME/.ssh/id_ed25519'

alias ipify='__print_and_execute curl -s https://api.ipify.org'
alias tmpdir='__print_and_execute cd $(mktemp -d)'
alias utcnow='__print_and_execute date -u +"%Y-%m-%dT%H:%M:%SZ" | __print_and_execute xargs echo -n'
alias utcnowsafe='date -u +"%Y-%m-%dT%H%M%SZ" | xargs echo -n'

# fzf

# Change default fzf command to use rg
export FZF_DEFAULT_COMMAND='rg --files --hidden'
# Use 16-color colorscheme
export FZF_DEFAULT_OPTS="--color 16"


# omz

export ZSH="$HOME/.oh-my-zsh"

plugins=(git fzf)

source $ZSH/oh-my-zsh.sh


# darwin

if [[ "$(uname)" = "Darwin" ]]; then
  # Homebrew
  if [ "$(arch)" = "arm64" ] && [[ -d "/opt/homebrew" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    echo "$(__pill_text OK 2) arm64 Homebrew"
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


# just
if [[ -f /opt/homebrew/bin/just ]]; then
  eval "$(just --completions zsh)"
  echo "$(__pill_text OK 2) just"
else
  echo "$(__pill_text WARN 3) just not found"
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


# starship

eval "$(starship init zsh)"
