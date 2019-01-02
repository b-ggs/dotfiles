if [[ "$(uname)" == "Darwin" ]]; then
  alias lock="open -a ScreenSaverEngine"
  alias hidedesktop='defaults write com.apple.finder CreateDesktop false && killall Finder'
  alias showdesktop='defaults write com.apple.finder CreateDesktop true && killall Finder'
elif [[ "$(uname)" == "Linux" ]]; then
  alias lock="i3lock"
fi

alias be='bundle exec'
alias bi='bundle install'
alias d='docker'
alias dc='docker-compose'

alias home="cd $HOME"
alias dev="cd $HOME/dev"
alias b-ggs="cd $HOME/dev/b-ggs"
alias dotfiles="cd $HOME/.files"
alias dump="mkdir -p $HOME/.dump && cd $HOME/.dump"
alias dotbin="cd $HOME/.bin"
alias Downloads="cd $HOME/Downloads"
alias Desktop="cd $HOME/Desktop"

alias known-hosts="$EDITOR $HOME/.ssh/known_hosts"
alias ssh-config="$EDITOR $HOME/.ssh/config"
alias authorized-keys="$EDITOR $HOME/.ssh/authorized_keys"

alias ind="cd $HOME/dev/jessicamah/indinero"

alias dbundle="ruby -I $HOME/dev/b-ggs/bundler/lib $HOME/dev/b-ggs/bundler/exe/bundle"
alias dpapa="ruby -I $HOME/dev/b-ggs/papa/lib $HOME/dev/b-ggs/papa/exe/papa"
