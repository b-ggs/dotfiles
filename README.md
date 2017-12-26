# dotfiles

Personal configurations for vim, zsh, tmux, etc.

## Contents
* [Setting Up](#setting-up)
* [Installation](#installation)
* [Post-installation](#post-installation)

## Setting Up

This setup guide is specifically for macOS. For Linux, refer to this (TODO!) readme.

Make sure you have [Xcode](xcode_direct_download) or Xcode Command Line Tools before proceeding.

Set up [Homebrew](homebrew).

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Install the essentials from Homebrew.

```
brew install git nvim vim zsh tmux reattach-to-user-namespace aria2 gpg the_silver_searcher fzf
```

Add zsh to your list of acceptable shells.

```
sudo sh -c "echo $(which zsh) >> /etc/shells"
```

Change the default shell to zsh.

```
chsh -s $(which zsh)
```

Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh).

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

## Installation

Clone the repository.

```
git clone https://github.com/b-ggs/dotfiles.git
```

Create symlinks using the script provided.

```
ruby bootstrap.rb
```

## Post-installation

### Neovim

Neovim should install all plugins with vim-plug on first run.

```
nvim
```

### RVM

Install rvm.

```
command curl -sSL https://rvm.io/mpapis.asc | gpg --import -
\curl -sSL https://get.rvm.io | bash -s stable
```

Install ruby and set as default.

```
rvm install 2.5.0
rvm use 2.5.0 --default
```

[xcode_direct_download]: https://stackoverflow.com/questions/10335747/how-to-download-xcode-dmg-or-xip-file
[homebrew]: https://brew.sh/
[oh-my-zsh]: https://github.com/robbyrussell/oh-my-zsh
[vundle]: https://github.com/VundleVim/Vundle.vim
