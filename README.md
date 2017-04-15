# dotfiles

Personal configurations for vim, zsh, tmux, etc.

Decided to dump my old [dotfiles repository](https://github.com/b-ggs/dotfiles-old) and start fresh.

![](http://i.imgur.com/IXu37fe.jpg)

## Installation

Clone the repository.

```
$ git clone https://github.com/b-ggs/dotfiles.git
```

Create symlinks using the script provided.

```
$ ruby bootstrap.sh
```

I recommend setting up `oh-my-zsh` before running the script, since the `oh-my-zsh` install script will complain when it finds that the `~/.oh-my-zsh` directory exists because we symlinked my custom zsh theme.

## Setting up vim

Install [vim]() from `brew` or [vim-gnome]() from AUR.

```
$ brew install vim
or
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
$ rvm install 2.3.1
$ rvm use 2.3.1 --default
```
