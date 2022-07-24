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
elif [[ "$(uname)" == "Linux" ]]; then
  alias lock='i3lock'
fi

alias be='bundle exec'
alias bi='bundle install'
alias d='docker'
alias dc='docker-compose'
alias pos='poetry shell'
alias vac='source venv/bin/activate'

alias home='cd $HOME'
alias dev='cd $HOME/dev'
alias b-ggs='cd $HOME/dev/b-ggs'
alias dotfiles='cd $HOME/.files'
alias dump='mkdir -p $HOME/.dump && cd $HOME/.dump'
alias dotbin='cd $HOME/.bin'
alias Downloads='cd $HOME/Downloads'
alias Desktop='cd $HOME/Desktop'
alias dockerfiles='cd $HOME/dev/b-ggs/dockerfiles'
alias wslhome='cd $(wslpath $(wslvar USERPROFILE))'

alias known-hosts='$EDITOR $HOME/.ssh/known_hosts'
alias ssh-config='cd $HOME/.ssh-config'
alias authorized-keys='cd $HOME/.authorized-keys'

alias ind='cd $HOME/dev/inDinero/indinero'
alias ind-map='cd $HOME/dev/inDinero/indinero-ms-map-rails-vproto'
alias ind-leap='cd $HOME/dev/inDinero/leap'
alias ind-ntbk='cd $HOME/dev/b-ggs/indinero-notebook'

alias mp='cd $HOME/dev/mplusmuseum/website-cms'
alias mf='cd $HOME/dev/mozilla/foundation.mozilla.org'
alias vw='cd $HOME/dev/vilantis/waste-backend'

alias lipsum='echo "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." | pbcopy'

alias sshkeys='ssh -o AddKeysToAgent=yes -o ForwardAgent=yes'

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

# Other functions

function gnubin_path() {
  export PATH="/usr/local/opt/make/libexec/gnubin:$PATH"
}

# omz

export ZSH="$HOME/.oh-my-zsh"

plugins=(git fzf)

source $ZSH/oh-my-zsh.sh

# fnm

if [[ -d "$HOME/.fnm" ]]; then
  export PATH="$HOME/.fnm:$PATH"
  eval "$(fnm env --use-on-cd)"
fi

# poetry

if [[ -d "$HOME/.poetry" ]]; then
  export PATH="$HOME/.poetry/bin:$PATH"
fi

# starship

eval "$(starship init zsh)"
