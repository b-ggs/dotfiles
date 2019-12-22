FROM debian:buster-slim

ENV DEBIAN_FRONTEND noninteractive

RUN apt update \
  && apt install -y cmake curl git neovim vim tmux gpg silversearcher-ag zsh sudo tmux ruby \
  && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
  && cd /tmp \
  && git clone https://github.com/sinclairtarget/um.git \
  && cd /tmp/um \
  && gem build *.gemspec \
  && gem install um*.gem \
  && rm -rf /tmp/um

ENV DOTFILES_PATH /root/.files
WORKDIR $DOTFILES_PATH
COPY . $DOTFILES_PATH

RUN make zsh-symlink \
  zsh-configure \
  nvim-symlink \
  nvim-configure \
  tmux-symlink \
  git-configure \
  git-symlink \
  vim-symlink \
  vim-configure \
  um-symlink

WORKDIR /data
