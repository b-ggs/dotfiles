# nvim

nvim-configure:
	curl -fLo ${HOME}/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	nvim --headless +PlugInstall +qall

nvim-install-language-servers:
	npm install --location=global pyright prettier

# zsh

zsh-configure:
	sh -c "$$(curl -fsSL https://starship.rs/install.sh)" -- --yes
	sh -c "$$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	rm -f $$HOME/.zshrc
	rm -f $$HOME/.zprofile
	@make zsh-configure-unix || make zsh-configure-termux

zsh-configure-unix: check-unix
	sudo sh -c "echo $$(command -v zsh) >> /etc/shells"
	chsh -s $$(command -v zsh)

zsh-configure-termux: check-termux
	chsh -s "zsh"

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
