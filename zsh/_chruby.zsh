CHRUBY="/usr/local/opt/chruby/share/chruby/chruby.sh"
CHRUBY_AUTO="/usr/local/opt/chruby/share/chruby/auto.sh"

[[ -e "$CHRUBY" ]] && source $CHRUBY
[[ -e "$CHRUBY_AUTO" ]] && source $CHRUBY_AUTO
