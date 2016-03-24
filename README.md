# dotfiles
Personal configurations for vim, zsh, tmux, etc.

Decided to dump my old [dotfiles repository](https://github.com/b-ggs/dotfiles-old) and start fresh.

## Installation
Clone the repository.
```
$ git clone https://github.com/b-ggs/dotfiles.git
```

Create symlinks using the script provided.
```
$ ./bootstrap.sh
```

## Setting up vim
Install [vim-gnome](https://aur.archlinux.org/packages/vim-gnome/) from AUR.
```
$ yaourt -S vim-gnome
```

Install [Vundle.vim](https://github.com/VundleVim/Vundle.vim).
```
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Install the plugins via Vundle.
```
$ vim +PluginInstall
```

## Setting up oh-my-zsh
Install via curl.
```
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

## Setting up rvm
Install rvm.
```
$ gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
$ \curl -sSL https://get.rvm.io | bash -s stable
```

Install ruby and set as default.
```
$ rvm install 2.3.0
$ rvm use 2.3.0 --default
```

## Setting up nvm
Install [nvm](https://aur.archlinux.org/packages/nvm/) from AUR.
```
$ yaourt -S nvm
```

Install node and set as default.
```
$ nvm install 4.4.1
$ nvm alias default 4.4.1
$ nvm use default
```
