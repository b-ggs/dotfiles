# brew

brew-common:
	brew install curl git nvim vim zsh tmux gpg fzf the_silver_searcher

brew-macos:
	brew cask install slate

brew-linux:
	brew install xclip

# vim:

vim-install:
	brew install vim

vim-symlink:
	@ORIGIN=vim/init.vim TARGET=${HOME}/.vimrc  make symlink
	@ORIGIN=vim/ TARGET=${HOME}/.vim/modules  make symlink

vim-configure:
	curl -fLo ${HOME}/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	vim -u ${PWD}/vim/_plugs.vim +PlugInstall +qall

# nvim:

nvim-install:
	brew install nvim

nvim-symlink:
	@ORIGIN=vim/init.vim TARGET=${HOME}/.config/nvim/init.vim make symlink
	@ORIGIN=vim/ TARGET=${HOME}/.config/nvim/modules make symlink

nvim-configure:
	curl -fLo ${HOME}/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	nvim -u ${PWD}/vim/_plugs.vim +PlugInstall +qall

# tmux

tmux-install:
	brew install tmux

tmux-symlink:
	@ORIGIN=tmux/tmux.conf TARGET=${HOME}/.tmux.conf make symlink

# tmuxinator

tmuxinator-install:
	gem install tmuxinator

tmuxinator-symlink:
	@ORIGIN=tmuxinator/ TARGET=${HOME}/.tmuxinator make symlink

# git

git-install:
	brew install git

git-configure:
	git/configure

git-symlink:
	@ORIGIN=git/gitignore TARGET=${HOME}/.gitignore make symlink

# slate

slate-install:
	brew cask install slate

slate-symlink:
	@ORIGIN=slate/slate.js TARGET=${HOME}/.slate.js make symlink

# termux

termux-install:
	apt-get install -y termux-api curl git neovim vim zsh tmux gnupg fzf silversearcher-ag ruby

# util

symlink:
	@mkdir -p $$(dirname ${TARGET})
	@rm -rf ${TARGET}
	ln -sf ${PWD}/${ORIGIN} ${TARGET}
