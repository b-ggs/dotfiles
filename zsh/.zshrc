# binds

# use emacs mode i think???
# https://unix.stackexchange.com/a/197841
bindkey -e
bindkey "^P" history-beginning-search-backward
bindkey "^N" history-beginning-search-forward

# env

export PATH="$PATH:$HOME/.bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:$HOME/.cargo/bin/"

if [[ "$(uname)" == "Linux" ]] && [[ ! $(uname -o) == "Android" ]]; then
  export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
  export PATH="/home/linuxbrew/.linuxbrew/sbin:$PATH"
  export PATH="/home/linuxbrew/.linuxbrew/opt:$PATH"
fi

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
elif [[ "$(uname)" == "Linux" ]]; then
  alias lock='i3lock'
fi

alias be='bundle exec'
alias bi='bundle install'
alias d='docker'
alias dc='docker-compose'
alias pos='poetry shell'
alias vac='source venv/bin/activate'
alias van='python3 -m venv venv'

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

alias lipsum='echo "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." | pbcopy'

alias sshkeys='ssh -o AddKeysToAgent=yes -o ForwardAgent=yes'
alias sshforward='ssh -L 8000:localhost:8000 -L 8143:localhost:8143 -L 8823:localhost:8823 -L 5678:localhost:5678 -L 3000:localhost:3000 -L 8086:localhost:8086 -L 5432:localhost:5432 -L 8080:localhost:8080 -L 8082:localhost:8082 -L 8001:localhost:8001 -CNT '

# pyenv

# check if pyenv is installed
if [[ -n "$(command -v pyenv)" ]]; then
  eval "$(pyenv init --path)"
fi

# fzf

# Change default fzf command to use rg
export FZF_DEFAULT_COMMAND='rg --files --hidden'
# Use 16-color colorscheme
export FZF_DEFAULT_OPTS="--color 16"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fnm

if [[ -d "$HOME/.fnm" ]] || [[ -f /opt/homebrew/bin/fnm ]]; then
  export PATH="$HOME/.fnm:$PATH"
  eval "$(fnm env --use-on-cd)"
fi

# fly

if [[ -d "$HOME/.fly" ]]; then
  export FLYCTL_INSTALL="/home/angela/.fly"
  export PATH="$FLYCTL_INSTALL/bin:$PATH"
fi

# deta

if [[ -d "$HOME/.deta" ]]; then
  export PATH="$HOME/.deta/bin:$PATH"
fi

# private zshrc

if [ -f "$HOME/.private.zshrc" ]; then
  source "$HOME/.private.zshrc" 
fi

# omz

export ZSH="$HOME/.oh-my-zsh"

plugins=(git fzf)

source $ZSH/oh-my-zsh.sh


# starship

eval "$(starship init zsh)"
