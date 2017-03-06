#!/bin/sh

dir=$PWD
installdir=~
files="vimrc ideavimrc vim zshrc tmux.conf dircolors tmuxinator"
for file in $files; do
    rm -rf $installdir/$file
    echo "Linking $dir/$file to $installdir/$file."
    ln -sfh $dir/$file $installdir/.$file
done

dir=$PWD/zsh
installdir=~/.oh-my-zsh/custom/themes
files="gnzh.zsh-theme outrun.zsh-theme"
mkdir -p $installdir
for file in $files; do
    rm -rf $installdir/$file
    echo "Linking $dir/$file to $installdir/$file."
    ln -sf $dir/$file $installdir/$file
done
