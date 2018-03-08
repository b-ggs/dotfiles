# dotfiles

Personal configurations for nvim, zsh, tmux, etc.

## Contents
* [Setting Up](#setting-up)
* [Installation](#installation)
* [Post-installation](#post-installation)

## Setting Up

On macOS, make sure you have [Xcode](xcode_direct_download) or Xcode Command Line Tools before proceeding.

Set up [Homebrew](homebrew) or [Linuxbrew](linuxbrew).

```
# Homebrew (macOS)
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Linuxbrew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
test -d ~/.linuxbrew && PATH="$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH"
test -d /home/linuxbrew/.linuxbrew && PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"
test -r ~/.bash_profile && echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >>~/.bash_profile
echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >>~/.profile
```

Install the essentials from brew.

```
brew install git nvim vim zsh tmux gpg fzf the_silver_searcher

# macOS only
brew install reattach-to-user-namespace
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
# If you are not Boggs
git clone https://github.com/b-ggs/dotfiles.git ~/.dotfiles

# If you are Boggs
git clone git@github.com:b-ggs/dotfiles.git ~/.dotfiles
```

Create symlinks using the script provided.

```
ruby bootstrap.rb
```

## Post-installation

### Other Packages I Use

These packages aren't required for my setup to work, but I still use them regularly.

```
brew install aria2
```

### Neovim

Install all plugins with vim-plug.

```
nvim +PlugInstall
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
[linuxbrew]: http://linuxbrew.sh/
[oh-my-zsh]: https://github.com/robbyrussell/oh-my-zsh
