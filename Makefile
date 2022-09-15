.PHONY: default
default:
	@echo "Starting Update Tasks"
	@make node
	@make brew

.PHONY: brew
brew:
	brew update && \
	brew upgrade && \
	brew cleanup

.PHONY: node
node:
	fnm install --lts && \
	fnm default lts-latest && \
	npm install -g npm yarn

.PHONY: setup
setup:
	brew install git fnm colima docker fzf koekeishiya/formulae/skhd koekeishiya/formulae/yabai starship && \
	brew tap homebrew/cask-fonts && \
	brew install --cask alacritty avibrazil-rdm onyx font-fira-code-nerd-font font-fira-mono-nerd-font
