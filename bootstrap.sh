#!/bin/sh

dir=$PWD

installdir=~
files=".vimrc .ideavimrc .vim .zshrc .tmux.conf .dircolors"
for file in $files; do
    rm -rf $installdir/$file
    echo "Linking $dir/$file to $installdir/$file."
    ln -s $dir/$file $installdir/$file
done

# installdir=~/.config
# files=""
# for file in $files; do
#     rm -rf $installdir/$file
#     echo "Linking $dir/$file to $installdir/$file."
#     ln -s $dir/$file $installdir/$file
# done
