export PATH="$PATH:$HOME/.bin"
export PATH="$PATH:$HOME/.local/bin"

if [[ "$(uname)" == "Linux" ]]; then
  export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
  export PATH="/home/linuxbrew/.linuxbrew/sbin:$PATH"
  export PATH="/home/linuxbrew/.linuxbrew/opt:$PATH"
fi

export TERM="xterm-256color"
export LANG="en_US.UTF-8"
export EDITOR="nvim"
export SHELL="$(which zsh)"

# Check if current session is over SSH
if [[ -n "$SSH_TTY" ]] && ( [[ "$SSH_TTY" == "$(tty)" ]] || ( [[ -n "$TMUX" ]] && [[ "$SSH_TTY" == "/dev/$(ps ax | grep "$(tmux display-message -p '#{client_pid}')" | grep -v grep | awk '{ print $2 }')" ]] ) ); then
  export IS_SSH="true"
fi
