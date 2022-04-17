FROM archlinux:base-devel

RUN pacman -Syu --noconfirm

# install neovim
RUN pacman -S --noconfirm neovim

# install zsh
RUN pacman -S --noconfirm zsh

# install git
RUN pacman -S --noconfirm git

# set default shell to zsh
RUN chsh -s /usr/sbin/zsh

# copy dotfiles
COPY . /root/.files

WORKDIR /root/.files

# RUN make nvim-symlink
# RUN make nvim-configure
RUN make zsh-symlink
RUN make zsh-configure
