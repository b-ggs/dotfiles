# oh-my-zsh
export ZSH=~/.oh-my-zsh
export NVM=/usr/share/nvm
ZSH_THEME="outrun"
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
export SHELL="/usr/local/bin/zsh"
export ANDROID_HOME=/usr/local/opt/android-sdk
export GOPATH=$HOME/Go

# Proxy settings
export proxy=""
export HTTP_PROXY="$proxy"
export HTTPS_PROXY="$proxy"
export FTP_PROXY="$proxy"
export http_proxy="$proxy"
export https_proxy="$proxy"
export ftp_proxy="$proxy"

# fzf
export FZF_DEFAULT_OPTS="--color 16"

# oh-my-zsh
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

# New aliases
alias vi='vim'
alias mux='tmuxinator'

# Directories
alias home="cd ~"
alias dev="cd ~/dev"
alias dotfiles="cd ~/dev/b-ggs/dotfiles"
alias dump="cd ~/dev/b-ggs/dump"
alias ind="cd ~/dev/jessicamah/indinero"

# Windows Subsystem for Linux directories
alias whome="cd /mnt/c/Users/$USER"
alias wdev="cd /mnt/c/Users/$USER/dev"
alias wdotfiles="cd /mnt/c/Users/$USER/dev/b-ggs/dotfiles"
alias wdump="cd /mnt/c/Users/$USER/dev/b-ggs/dump"
alias wind="cd /mnt/c/Users/$USER/dev/jessicamah/indinero"

# SSH
alias sshfix="eval ssh-agent && ssh-add ~/.ssh/id_rsa"

# Bundle alias
alias be="bundle exec"

# Docker
alias docker-init='eval $(docker-machine env default)'

# bundler
alias dbundle="ruby -I /Users/boggs/dev/b-ggs/bundler/lib /Users/boggs/dev/b-ggs/bundler/exe/bundle"
alias dbundler="ruby -I /Users/boggs/dev/b-ggs/bundler/lib /Users/boggs/dev/b-ggs/bundler/exe/bundler"

# b-ggs/papa
alias dpapa="ruby -I /Users/boggs/dev/b-ggs/papa/lib /Users/boggs/dev/b-ggs/papa/exe/papa"

# fzf
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="$PATH:/usr/local/opt/fzf/bin"
fi
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null
source "/usr/local/opt/fzf/shell/key-bindings.zsh"

