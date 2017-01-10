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
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/Android/Sdk/platform-tools"

# Env variables
export TERM="xterm-256color"
export LANG="en_US.UTF-8"
export EDITOR="vim"
export GOPATH=~/go
export ANDROID_HOME=/usr/local/opt/android-sdk
export NVM_DIR="$HOME/.nvm"

# Proxy settings
export proxy=""
export HTTP_PROXY="$proxy"
export HTTPS_PROXY="$proxy"
export FTP_PROXY="$proxy"
export http_proxy="$proxy"
export https_proxy="$proxy"
export ftp_proxy="$proxy"

source $ZSH/oh-my-zsh.sh
# source ~/.bin/tmuxinator.zsh
# source $NVM/init-nvm.sh
# . "$(brew --prefix nvm)/nvm.sh"

# Disable xoff
eval "stty -ixon"

# Directory colors
# test -r $d && eval "$(dircolors ~/.dircolors)"

# System
# alias svol="amixer -D pulse sset Master "
# alias svolm="pactl set-sink-volume 1 "
# alias mntall="udisks --mount /dev/sda4 && udisks --mount /dev/sda6"
# alias synconfig="~/dotfiles/scripts/synconfig.sh"

# Commands
alias findgrep="find . | grep"
alias hisgrep="history | grep"
alias findag="find . | ag"
# alias chrome="google-chrome"
# alias mux="tmuxinator"
# alias bgreset="~/dotfiles/scripts/background.sh"
# alias bgset="feh --bg-fill"
# alias intellijrescue="killall -9 ibus-x11"
# alias ping1="ping -i 0.2 google.com"

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

# Clipboard
# alias pbcopyx="xclip -selection clipboard"
# alias pbpastex="xclip -selection clipboard -o"

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
 
# Nativescript docker
alias tns='docker run -it --rm --privileged -v /dev/bus/usb:/dev/bus/usb -v \$PWD:/home/nativescript m1burn/nativescript tns'

# inD
alias ind='cd ~/dev/jessicamah/indinero'
