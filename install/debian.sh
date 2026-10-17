#!/usr/bin/env bash

set -euo pipefail

if [[ "$(uname -s)" != "Linux" ]] || [[ ! -f /etc/os-release ]]; then
  echo "This installer supports Debian and Ubuntu Linux." >&2
  exit 1
fi

# shellcheck disable=SC1091
source /etc/os-release
case "${ID:-}" in
  debian|ubuntu) ;;
  *)
    echo "Unsupported distribution: ${ID:-unknown}. Use Debian or Ubuntu." >&2
    exit 1
    ;;
esac

if [[ $EUID -eq 0 ]]; then
  apt=(apt-get)
else
  command -v sudo >/dev/null 2>&1 || {
    echo "sudo is required when this script is not run as root." >&2
    exit 1
  }
  apt=(sudo apt-get)
fi

packages=(
  aria2
  bat
  boxes
  btop
  build-essential
  ca-certificates
  cmake
  curl
  file
  git
  golang-go
  htop
  keychain
  locales
  parallel
  pngcrush
  procps
  progress
  python3
  python3-venv
  ripgrep
  shellcheck
  stow
  tmux
  tmuxp
  tree
  universal-ctags
  unzip
  util-linux
  wget
  wl-clipboard
  xclip
  xdg-utils
  zsh
)

"${apt[@]}" update
"${apt[@]}" install -y --no-install-recommends "${packages[@]}"

mkdir -p "$HOME/.local/bin" "$HOME/.local/opt"

machine="$(uname -m)"
case "$machine" in
  x86_64|amd64)
    nvim_arch="x86_64"
    eza_target="x86_64-unknown-linux-gnu"
    fzf_arch="amd64"
    gh_arch="amd64"
    tealdeer_arch="x86_64"
    rs_fortune_target="x86_64-unknown-linux-gnu"
    tree_sitter_arch="x64"
    ;;
  aarch64|arm64)
    nvim_arch="arm64"
    eza_target="aarch64-unknown-linux-gnu"
    fzf_arch="arm64"
    gh_arch="arm64"
    tealdeer_arch="aarch64"
    rs_fortune_target="aarch64-unknown-linux-gnu"
    tree_sitter_arch="arm64"
    ;;
  *)
    echo "Unsupported CPU architecture: $machine" >&2
    exit 1
    ;;
esac

install_nvim() {
  local destination="$HOME/.local/opt/nvim"
  local archive
  archive="$(mktemp)"
  curl -fsSL "https://github.com/neovim/neovim/releases/latest/download/nvim-linux-${nvim_arch}.tar.gz" -o "$archive"
  rm -rf "$destination"
  mkdir -p "$destination"
  tar -xzf "$archive" -C "$destination" --strip-components=1
  rm -f "$archive"
  ln -sfn "$destination/bin/nvim" "$HOME/.local/bin/nvim"
}

if ! command -v nvim >/dev/null 2>&1; then
  install_nvim
fi

if ! command -v eza >/dev/null 2>&1; then
  curl -fsSL "https://github.com/eza-community/eza/releases/latest/download/eza_${eza_target}.tar.gz" \
    | tar -xz -C "$HOME/.local/bin"
fi

fzf_version="$(curl -fsSLI -o /dev/null -w '%{url_effective}' https://github.com/junegunn/fzf/releases/latest | sed 's#.*/v##')"
curl -fsSL "https://github.com/junegunn/fzf/releases/download/v${fzf_version}/fzf-${fzf_version}-linux_${fzf_arch}.tar.gz" \
  | tar -xz -C "$HOME/.local/bin"

gh_version="$(curl -fsSLI -o /dev/null -w '%{url_effective}' https://github.com/cli/cli/releases/latest | sed 's#.*/v##')"
curl -fsSL "https://github.com/cli/cli/releases/download/v${gh_version}/gh_${gh_version}_linux_${gh_arch}.tar.gz" \
  | tar -xz -C "$HOME/.local/bin" --strip-components=2 "gh_${gh_version}_linux_${gh_arch}/bin/gh"

tealdeer_version="$(curl -fsSLI -o /dev/null -w '%{url_effective}' https://github.com/tealdeer-rs/tealdeer/releases/latest | sed 's#.*/v##')"
curl -fsSL "https://github.com/tealdeer-rs/tealdeer/releases/download/v${tealdeer_version}/tealdeer-linux-${tealdeer_arch}-musl" \
  -o "$HOME/.local/bin/tldr"
chmod +x "$HOME/.local/bin/tldr"

curl -fsSL "https://github.com/zuisong/rs-fortune/releases/latest/download/rs-fortune-${rs_fortune_target}.tar.gz" \
  | tar -xz -C "$HOME/.local/bin" rs-fortune

curl -fsSL "https://github.com/tree-sitter/tree-sitter/releases/latest/download/tree-sitter-linux-${tree_sitter_arch}.gz" \
  | gunzip > "$HOME/.local/bin/tree-sitter"
chmod +x "$HOME/.local/bin/tree-sitter"

if ! command -v just >/dev/null 2>&1; then
  curl --proto '=https' --tlsv1.2 -fsSL https://just.systems/install.sh \
    | bash -s -- --to "$HOME/.local/bin"
fi

if ! command -v starship >/dev/null 2>&1; then
  curl -fsSL https://starship.rs/install.sh \
    | sh -s -- --yes --bin-dir "$HOME/.local/bin"
fi

if ! command -v herdr >/dev/null 2>&1; then
  curl -fsSL https://herdr.dev/install.sh | sh
fi

# Also replaces an existing OpenCode 1 install, which lives at the same path
opencode_version="$("$HOME/.opencode/bin/opencode" --version 2>/dev/null || true)"
opencode_version="${opencode_version##* }"
if [[ "${opencode_version#v}" != 2.* ]]; then
  curl -fsSL https://opencode.ai/v2/install | bash -s -- --no-modify-path
fi

if ! command -v uv >/dev/null 2>&1; then
  curl -LsSf https://astral.sh/uv/install.sh | sh
fi

fnm_bin="$HOME/.local/share/fnm/fnm"
if [[ ! -x "$fnm_bin" ]]; then
  curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell
fi
"$fnm_bin" install --lts
"$fnm_bin" default lts-latest

echo
echo "Linux terminal dependencies installed. Run 'make linux-configure' from the dotfiles repository."
