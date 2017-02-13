# oh-my-zsh
export ZSH=~/.oh-my-zsh
export NVM=/usr/share/nvm
ZSH_THEME="gnzh"
DISABLE_AUTO_TITLE="true"
plugins=(git nvm rvm)

# PATH
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:$HOME/usr/local/rvm/bin"
export PATH="$PATH:$HOME/.gem/ruby/2.3.1/bin"
export PATH="$PATH:$HOME/Android/Sdk/platform-tools"
export PATH="$PATH:/usr/local/opt/node@6/bin"

# Env variables
export TERM="xterm-256color"
export LANG="en_US.UTF-8"
export EDITOR="vim"
export ANDROID_HOME=/usr/local/opt/android-sdk

# Proxy settings
export proxy=""
export HTTP_PROXY="$proxy"
export HTTPS_PROXY="$proxy"
export FTP_PROXY="$proxy"
export http_proxy="$proxy"
export https_proxy="$proxy"
export ftp_proxy="$proxy"

source $ZSH/oh-my-zsh.sh

# Disable xoff
eval "stty -ixon"

# Commands
alias findgrep="find . | grep"
alias hisgrep="history | grep"
alias findag="find . | ag"

# Tmux
alias tmuxl="tmux ls"
alias tmuxa="tmux attach-session -t"
alias tmuxk="tmux kill-session -t"
alias tmuxd="tmux detach"

# Directories
alias home="cd ~"
alias dotfiles="cd ~/dev/b-ggs/dotfiles"
alias dev="cd ~/dev"
alias dump="cd ~/dump"

# New aliases
alias vi='vim'
alias mux='tmuxinator'

# bundler
alias dbundle="ruby -I /Users/boggs/dev/bundler/lib /Users/boggs/dev/bundler/exe/bundle"
alias dbundler="ruby -I /Users/boggs/dev/bundler/lib /Users/boggs/dev/bundler/exe/bundler"

# SSH
alias sshfix="eval ssh-agent && ssh-add ~/.ssh/id_rsa"

# Bundle alias
alias be="bundle exec"

# Docker
alias docker-init='eval $(docker-machine env default)'

# inD
alias ind='cd ~/dev/jessicamah/indinero'
