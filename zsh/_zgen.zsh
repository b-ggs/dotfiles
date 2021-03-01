source "$HOME/.zgen/zgen.zsh"
if [[ -n "$(command -v zgen 2> /dev/null)" ]] && ! zgen saved; then
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/docker
  zgen oh-my-zsh plugins/docker-compose
  zgen oh-my-zsh plugins/pyenv
  zgen oh-my-zsh plugins/virtualenv
  zgen save
fi
