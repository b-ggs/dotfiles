#!/usr/bin/env bash

set -euo pipefail

required_commands=(
  batcat
  eza
  fnm
  fzf
  gh
  git
  go
  herdr
  just
  nvim
  opencode
  rg
  rs-fortune
  starship
  stow
  tldr
  tmux
  tree-sitter
  uv
  zsh
)

for command_name in "${required_commands[@]}"; do
  command -v "$command_name" >/dev/null 2>&1 || {
    echo "Missing command: $command_name" >&2
    exit 1
  }
done

fnm exec --using=lts-latest node --version
tree-sitter --version

zsh -n "$HOME/.zshrc"
zsh_output="$(script -qec "zsh -lic 'echo ZSH_CONFIG_OK'" /dev/null 2>&1)"
printf '%s\n' "$zsh_output"
grep -q 'ZSH_CONFIG_OK' <<<"$zsh_output"
if grep -Eq 'command not found|can.t infer shell|can.t change option' <<<"$zsh_output"; then
  echo "Zsh configuration emitted a startup error." >&2
  exit 1
fi

tmux -L dotfiles-test -f "$HOME/.tmux.conf" start-server \; show-options -g >/dev/null
tmux -L dotfiles-test kill-server 2>/dev/null || true

nvim_output="$(nvim --headless '+qa' 2>&1)"
if grep -Eq '(^|[[:space:]])E[0-9]+:|Error detected|Error in' <<<"$nvim_output"; then
  printf '%s\n' "$nvim_output"
  echo "Neovim configuration emitted a startup error." >&2
  exit 1
fi

for script in "$HOME"/.bin/*; do
  if head -n 1 "$script" | grep -qE '/(ba)?sh$'; then
    shellcheck "$script"
  fi
done

echo "Linux smoke tests passed."
