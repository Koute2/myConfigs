.PHONY: default
default:
	@echo "Starting Update Tasks"
	@make brew

.PHONY: brew
brew:
	brew update && \
	brew upgrade && \
	brew cleanup

.PHONY: setup
setup:
	@echo "Starting Setup Workflow"
	@echo "Copy and place settings"
	cp -r .bashrc .zshrc Brewfile .config ~/
	@echo "Install Homebrew"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	@echo "Install Homebrew Bundle"
	brew update
	brew bundle install
	@echo "Start window manager services"
	yabai --start-service
	skhd --start-service
	@echo "Install zinit"
	bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
	@echo "Done!"
