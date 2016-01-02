# dotfiles
Personal configurations for vim, zsh, tmux, etc.

Decided to dump my old [dotfiles repository](https://github.com/b-ggs/dotfiles-old) and start fresh.

## Installation
Clone the repository.
```
$ git clone https://github.com/b-ggs/dotfiles.git
```

Create symlinks to `~` using the script provided.
```
./bootstrap.sh
```

## Setting up vim
\#vimmasterrace 

I'm running under the assumption that you have a build of `vim` with `+clipboard`. If you're on a Linux OS, and installed `vim` via `apt-get` or `pacman`, follow [this guide]() `//TODO: ADD LINK TO GUIDE` on getting a build of `vim` with `+clipboard`. 

Install [Vundle.vim](https://github.com/VundleVim/Vundle.vim).
```
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Install the plugins via Vundle.
```
$ vim +PluginInstall
```
