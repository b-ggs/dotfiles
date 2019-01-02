# Disable xoff
# https://superuser.com/questions/124845/can-you-disable-the-ctrl-s-xoff-keystroke-in-putty
eval "stty -ixon"

# https://github.com/b-ggs/fortune-undertale-determination
[[ -n "$(command -v fortune 2> /dev/null)" ]] && fortune undertale-determination
