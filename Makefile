# brew

brew-common: check-unix
	brew install curl git nvim vim zsh tmux gpg fzf the_silver_searcher um

brew-macos: check-darwin
	brew cask install slate

brew-linux: check-gnu-linux
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

# zsh

zsh-install:
	brew install zsh

zsh-symlink:
	@ORIGIN=zsh/init.zsh TARGET=${HOME}/.zshrc make symlink
	@ORIGIN=zsh/ TARGET=${HOME}/.zsh make symlink

zsh-configure:
	@rm -rf ${HOME}/.zgen
	git clone https://github.com/tarjoilija/zgen.git ${HOME}/.zgen
	@make zsh-configure-unix || make zsh-configure-termux

zsh-configure-unix: check-unix
	sudo sh -c "echo $$(command -v zsh) >> /etc/shells"
	chsh -s $$(command -v zsh)

zsh-configure-termux: check-termux
	chsh -s "zsh"

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

# um

um-install:
	brew install um

um-symlink:
	@ORIGIN=um TARGET=${HOME}/.um make symlink

# karabiner

karabiner-install:
	brew install karabiner-elements

karabiner-symlink:
	@ORIGIN=karabiner/karabiner.json TARGET=${HOME}/.config/karabiner/karabiner.json make symlink

# termux

termux-install:
	apt-get install -y termux-api curl git neovim vim zsh tmux gnupg fzf silversearcher-ag ruby

# util

symlink:
	@mkdir -p $$(dirname ${TARGET})
	@rm -rf ${TARGET}
	ln -sf ${PWD}/${ORIGIN} ${TARGET}

check-unix:
	@make check-darwin || make check-linux

check-darwin:
	test "$$(uname)" = "Darwin"

check-gnu-linux: check-linux
	test "$$(uname -o)" = "GNU/Linux"

check-termux: check-linux
	test ${PREFIX} = "/data/data/com.termux/files/usr"
	test "$$(uname -o)" = "Android"

check-linux:
	test "$$(uname)" = "Linux"
