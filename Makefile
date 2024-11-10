# zsh

zsh-configure:
	sh -c "$$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	rm -f $$HOME/.zshrc
	rm -f $$HOME/.zprofile

# git

git-configure:
	git/configure

# util

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

bump-homebrew:
	cd homebrew && brew bundle

bump-nvim-lazy:
	nvim --headless "+Lazy! update" +qa

bump-nvim-mason:
	nvim "+MasonToolsUpdate" "+MasonLock"
