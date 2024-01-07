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
elif [[ "$(uname)" == "Linux" ]]; then
  alias lock='i3lock'
fi

alias poi='poetry install --sync'
alias pos='poetry shell'
alias popreferactive='poetry config virtualenvs.prefer-active-python true'

povenvpath() {
  poetry env info | awk '/^Path:/{print $2; exit}'
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


# fzf

# Change default fzf command to use rg
export FZF_DEFAULT_COMMAND='rg --files --hidden'
# Use 16-color colorscheme
export FZF_DEFAULT_OPTS="--color 16"


# fnm

if [[ -f /opt/homebrew/bin/fnm ]]; then
  eval "$(fnm env --use-on-cd)"
  echo "$(__pill_text OK 2) fnm"
else
  echo "$(__pill_text WARN 3) fnm not found"
fi


# keychain

if [[ -d "$HOME/.keychain" ]]; then
  keychain --nogui -q $HOME/.ssh/id_ed25519
  source $HOME/.keychain/$(hostname)-sh
  echo "$(__pill_text OK 2) keychain"
else
  echo "$(__pill_text WARN 3) keychain not found"
fi


# private zshrc

if [ -f "$HOME/.private.zshrc" ]; then
  source "$HOME/.private.zshrc" 
  echo "$(__pill_text OK 2) private zshrc"
else
  echo "$(__pill_text WARN 3) private zshrc not found"
fi


# omz

export ZSH="$HOME/.oh-my-zsh"

plugins=(git fzf)

source $ZSH/oh-my-zsh.sh


# starship

eval "$(starship init zsh)"
