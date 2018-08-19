# dotfiles

Personal configurations for nvim, zsh, tmux, etc.

## TL;DR

```
git clone git@github.com:b-ggs/dotfiles.git ~/.dotfiles
~/.dotfiles/common/install
~/.dotfiles/zsh/install
~/.dotfiles/neovim/install
~/.dotfiles/git/install
~/.dotfiles/tmux/install
~/.dotfiles/tmuxinator/install
```

## Everything below this line is still a WIP.

## Contents
* [Installation](#installation)
* [Manual Configuration](#manual-configuration)

## Installation

* Clone the repository.

* On macOS, make sure you have [Xcode](xcode_direct_download) or Xcode Command Line Tools before proceeding.

* Install dependencies with

```
./dependencies
```

* Symlink dotfiles with

```
./symlink
```

* Do some post-installation magic with

```
./postinstall
```

## Manual Configuration

Unfortunately, we can't configure everything from the command line. (Or at least I haven't attempted to.)

### macOS

Enable `System Preferences > General > Use dark menu and Dock`.

Enable `System Preferences > General > Automatically hide and show the menu bar`.

Enable `System Preferences > Dock > Automatically hide and show the Dock`.

Under `System Preferences > Security & Privacy > Privacy > Accessibility`, make sure to enable `Slate`.

Under `System Preferences > Users & Groups > Login Items`, make sure `Slate` and `Übersicht` are listed.

### iTerm2

Launch iTerm2.

Go to `iTerm2 > Preferences...`.

Under the `General` tab, set the value of `Load preferences from a custom folder or URL` to `~/.iterm2`.

When asked if you want to copy your current iTerm2 config, select `No`.

Quit iTerm2.

Upon relaunch, the config should be loaded.

### Übersicht

Launch Übersicht.

On the menu bar, click on the the Übersicht and head over to `Preferences...`

Under the `General` tab, set the `Widgets Folder` to `~/.uebersicht`.

Quit Übersicht.

Upon relaunch, all the widgets should properly load.

[xcode_direct_download]: https://stackoverflow.com/questions/10335747/how-to-download-xcode-dmg-or-xip-file
