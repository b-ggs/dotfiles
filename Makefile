zsh-configure:
	test -d $$HOME/.oh-my-zsh || git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git $$HOME/.oh-my-zsh

linux-install:
	./install/debian.sh

linux-configure: zsh-configure git-configure gh-configure
	stow --restow bin ctags git herdr just nvim opencode ripgrep tealdeer tmux zsh

macos-configure: zsh-configure git-configure gh-configure swiftbar-configure
	stow --restow bin ctags git hammerspoon herdr just kitty nvim opencode ripgrep tealdeer tmux zsh

git-configure:
	git/configure

swiftbar-configure:
	defaults write com.ameba.SwiftBar PluginDirectory $$HOME/.files/swiftbar

gh-configure:
	gh alias delete --all
	gh alias import --clobber ./gh/aliases.yml

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

brew-bundle:
	cd homebrew && brew bundle --verbose

nvim-lazy-update:
	nvim --headless "+Lazy! update $(PLUGINS)" +qa

nvim-mason-update:
	nvim --headless +MasonToolsUpdateSync +MasonLock +qa

format:
	find . -name "*.lua" | xargs npx @johnnymorganz/stylua-bin
