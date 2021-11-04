# brew

brew-common: check-unix
	brew install curl git nvim zsh tmux gpg fzf the_silver_searcher um ripgrep

brew-macos: check-darwin
	brew cask install hammerspoon

brew-linux: check-gnu-linux
	brew install xclip

# nvim:

nvim-install:
	brew install nvim

nvim-symlink:
	@ORIGIN=nvim/init.vim TARGET=${HOME}/.config/nvim/init.vim make symlink
	@ORIGIN=nvim/coc-settings.json TARGET=${HOME}/.config/nvim/coc-settings.json make symlink

nvim-configure:
	curl -fLo ${HOME}/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	nvim -u ${PWD}/vim/_plugs.vim +PlugInstall +qall

# zsh

zsh-install:
	brew install zsh

zsh-symlink:
	@ORIGIN=zsh/zprofile TARGET=${HOME}/.zprofile make symlink
	@ORIGIN=zsh/zshrc TARGET=${HOME}/.zshrc make symlink

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

# alacritty

alacritty-symlink:
	@ORIGIN=alacritty/alacritty.yml TARGET=${HOME}/.config/alacritty/alacritty.yml make symlink

# kitty

kitty-symlink:
	@ORIGIN=kitty/kitty.conf TARGET=${HOME}/.config/kitty/kitty.conf make symlink

# streamlink

streamlink-symlink:
	@ORIGIN=streamlink/config TARGET=${HOME}/.config/streamlink/config make symlink

# hammerspoon

hammerspoon-symlink:
	@ORIGIN=hammerspoon/init.lua TARGET=${HOME}/.hammerspoon/init.lua make symlink

# ripgrep
ripgrep-symlink:
	@ORIGIN=ripgrep/ripgreprc TARGET=${HOME}/.ripgreprc make symlink

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
