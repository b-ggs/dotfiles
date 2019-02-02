brew-common:
	brew install curl git nvim vim zsh tmux gpg fzf the_silver_searcher

brew-linux:
	brew install xclip

git-install:
	brew install git

git-configure:
	git/configure

git-symlink:
	ORIGIN=git/gitignore TARGET=${HOME}/.gitignore make symlink

symlink:
	mkdir -p $$(dirname ${TARGET})
	rm -rf ${TARGET}
	ln -sf ${PWD}/${ORIGIN} ${TARGET}
