export ZSH=~/.oh-my-zsh
ZSH_THEME="gnzh"
DISABLE_AUTO_TITLE="true"
plugins=(git)

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PATH="$PATH:$HOME/exec"
export TERM="xterm-256color" # 256 colors in gnome-terminal

source $ZSH/oh-my-zsh.sh

d=~/.dircolors
test -r $d && eval "$(dircolors $d)"

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
alias vimb="cd ~/.vim/bundle"

# Displays
alias extdis="xrandr --output HDMI1 --off --output DP1 --off"
alias extspec="~/dotfiles/xrandr/x450ldv_spectrum_right.sh"
alias extmirror="xrandr --output DP1 --same-as eDP1 --mode 1024x768"
alias soff="xset dpms force off"

# Startup
alias sup="~/dotfiles/startup/home_vga.sh"

# Programs
alias matlab2015exec="/usr/local/MATLAB/R2015b/bin/matlab"
alias matlab2009exec="~/MATHWORKS_R2009B/bin/matlab"

# Clipboard
alias pbcopy="xclip -selection clipboard"
alias pbpaste="xclip -selection clipboard -o"

# New aliases
alias vi="vim"
