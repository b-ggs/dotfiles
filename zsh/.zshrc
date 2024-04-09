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


# aliases

if [[ "$(uname)" == "Darwin" ]]; then
  alias lock='open -a ScreenSaverEngine'
  alias hidedesktop='defaults write com.apple.finder CreateDesktop false && killall Finder'
  alias showdesktop='defaults write com.apple.finder CreateDesktop true && killall Finder'
  alias resetdock='defaults write com.apple.dock tilesize -int 32; killall Dock'
  alias flushdnscache='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'
  alias chromeguest='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --guest &'
elif [[ "$(uname)" == "Linux" ]]; then
  alias lock='i3lock'
fi

alias poi='poetry install --sync'
alias pos='poetry shell'
alias popreferactive='poetry config virtualenvs.prefer-active-python true'

povenvpath() {
  poetry env info | awk '/^Path:/{print $2; exit}'
}

podestroyvenv() {
  deactivate 2> /dev/null
  local venvpath=$(povenvpath)
  if [[ -n "$venvpath" ]]; then
    rm -rf "$venvpath"
  else
    echo "No venv found"
  fi
}

alias van='python3 -m venv venv'
alias vac='source venv/bin/activate'
alias vad='deactivate'

alias home='cd $HOME'
alias dev='cd $HOME/dev'
alias b-ggs='cd $HOME/dev/b-ggs'
alias dotfiles='cd $HOME/.files'
alias dotfilesprivate='cd $HOME/.files-private'
alias dump='mkdir -p $HOME/.dump && cd $HOME/.dump'
alias dotbin='cd $HOME/.bin'
alias Downloads='cd $HOME/Downloads'
alias Desktop='cd $HOME/Desktop'
alias dockerfiles='cd $HOME/dev/b-ggs/dockerfiles'
alias wslhome='cd $(wslpath $(wslvar USERPROFILE))'

alias known-hosts='$EDITOR $HOME/.ssh/known_hosts'
alias ssh-config='cd $HOME/.ssh-config'
alias authorized-keys='cd $HOME/.authorized-keys'

alias sshforward='ssh -L 8000:localhost:8000 -L 8143:localhost:8143 -L 8823:localhost:8823 -L 5678:localhost:5678 -L 3000:localhost:3000 -L 8086:localhost:8086 -L 5432:localhost:5432 -L 8080:localhost:8080 -L 8082:localhost:8082 -L 8001:localhost:8001 -CNT '

alias keychainloaddefault='keychain --nogui -q $HOME/.ssh/id_ed25519'


# fzf

# Change default fzf command to use rg
export FZF_DEFAULT_COMMAND='rg --files --hidden'
# Use 16-color colorscheme
export FZF_DEFAULT_OPTS="--color 16"


# omz

export ZSH="$HOME/.oh-my-zsh"

plugins=(git fzf)

source $ZSH/oh-my-zsh.sh


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

# mise

if [[ -f "$(which mise)" ]]; then
  eval "$(mise activate zsh)"
  echo "$(__pill_text OK 2) mise"
else
  echo "$(__pill_text WARN 3) mise not found"
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
