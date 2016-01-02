# oh-my-zsh
export ZSH=~/.oh-my-zsh
ZSH_THEME="eastwood"
DISABLE_AUTO_TITLE="true"
plugins=(git)

# PATH
export PATH="$PATH:$HOME/.rbenv/bin"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.gem/ruby/2.2.0/bin"

# Env variables
export TERM="xterm-256color"
export LANG="en_US.UTF-8"
export GOPATH=~/go

# precmd
precmd () {print -Pn "\e]0;%n@%m: %~\a"}

source $ZSH/oh-my-zsh.sh

# rbenv
eval "$(rbenv init -)"

# Directory colors
test -r $d && eval "$(dircolors ~/.dircolors)"

# System
alias svol="amixer -D pulse sset Master "
alias svolm="pactl set-sink-volume 1 "
alias mntall="udisks --mount /dev/sda4 && udisks --mount /dev/sda6"
alias synconfig="~/dotfiles/scripts/synconfig.sh"

# Commands
alias findgrep="find . | grep"
alias hisgrep="history | grep"
alias findag="find . | ag"
alias chrome="google-chrome"
alias mux="tmuxinator"
alias bgreset="~/dotfiles/scripts/background.sh"
alias bgset="feh --bg-fill"
alias intellijrescue="killall -9 ibus-x11"

# Tmux
alias tmuxl="tmux ls"
alias tmuxa="tmux attach-session -t"
alias tmuxk="tmux kill-session -t"
alias tmuxd="tmux detach"

# Directories
alias home="cd ~"
alias dotfiles="cd ~/dotfiles"
alias dev="cd ~/dev"

# Clipboard
alias pbcopy="xclip -selection clipboard"
alias pbpaste="xclip -selection clipboard -o"

# New aliases
alias vi="vim"
