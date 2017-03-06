#!/bin/bash
# http://superuser.com/questions/285381/how-does-the-tmux-color-palette-work
if [ -z $1 ]; then
    BREAK=1
else
    BREAK=$1
fi
for i in {0..255} ; do
    printf "\x1b[38;5;${i}mcolour${i} \t"
    # if [ $(( i % $BREAK )) -eq $(($BREAK-1)) ] ; then
    #     # printf "\n"
    # fi
done
