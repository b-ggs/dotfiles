#!/bin/sh

dir=$PWD

installdir=~
files=".zshrc"
for file in $files; do
    rm -rf $installdir/$file
    echo "Linking $dir/$file to $installdir/$file."
    ln -s $dir/$file $installdir/$file
done

installdir=~/.config
files="terminator"
for file in $files; do
    rm -rf $installdir/$file
    echo "Linking $dir/$file to $installdir/$file."
    ln -s $dir/$file $installdir/$file
done
