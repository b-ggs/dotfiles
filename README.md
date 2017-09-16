# dotfiles

Personal configurations for vim, zsh, tmux, etc.

## Contents

[Setting Up](#setting-up)

[Installation](#installation)

[Post-installation](#post-installation)

## Setting Up

This setup guide is specifically for macOS. For Linux, refer to this (TODO!) readme.

Make sure you have [Xcode](xcode_direct_download) or Xcode Command Line Tools before proceeding.

Set up [Homebrew](homebrew).

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Install the essentials from Homebrew.

```
brew install git vim zsh tmux reattach-to-user-namespace aria2 gpg the_silver_searcher fzf
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

### Setting up vim

Install [Vundle.vim](vundle).

```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Install the plugins via Vundle.

```
vim +PluginInstall
```

### Setting up rvm

Install rvm.

```
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable
```

Install ruby and set as default.

```
rvm install 2.3.1
rvm use 2.3.1 --default
```

[xcode_direct_download]: https://stackoverflow.com/questions/10335747/how-to-download-xcode-dmg-or-xip-file
[homebrew]: https://brew.sh/
[oh-my-zsh]: https://github.com/robbyrussell/oh-my-zsh
[vundle]: https://github.com/VundleVim/Vundle.vim
