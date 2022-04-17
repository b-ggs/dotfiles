FROM archlinux:base-devel

RUN pacman -Syu --noconfirm

# install packages
RUN pacman -S --noconfirm neovim zsh git ripgrep fzf tmux nodejs

# copy dotfiles
COPY . /root/.files/

WORKDIR /root/.files/

RUN make nvim-symlink
RUN make nvim-configure
RUN make zsh-configure
RUN make zsh-symlink
RUN make tmux-symlink

WORKDIR /root/
