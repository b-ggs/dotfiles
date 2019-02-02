# brew

brew-common:
	brew install curl git nvim vim zsh tmux gpg fzf the_silver_searcher

brew-macos:
	brew cask install slate

brew-linux:
	brew install xclip

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

# util

symlink:
	@mkdir -p $$(dirname ${TARGET})
	@rm -rf ${TARGET}
	ln -sf ${PWD}/${ORIGIN} ${TARGET}
