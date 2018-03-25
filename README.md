# dotfiles

Personal configurations for nvim, zsh, tmux, etc.

## Contents
* [Installation](#installation)
* [Post-installation](#post-installation)

## Installation

On macOS, make sure you have [Xcode](xcode_direct_download) or Xcode Command Line Tools before proceeding.

Clone the repository.

Run the script included to install Homebrew, install dependencies, and symlink dotfiles.

```
ruby install_mac.rb
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

Neovim may glitch out on first run, but succeeding runs should have it behave normally.

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
