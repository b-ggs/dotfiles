source "$HOME/.zgen/zgen.zsh"
if [[ -n "$(command -v zgen 2> /dev/null)" ]] && ! zgen saved; then
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/chruby
  zgen save
fi
