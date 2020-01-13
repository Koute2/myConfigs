.PHONY: default
default:
	@sudo echo "Starting Update Tasks"
	@make gem
	@make node
	@make brew

.PHONY: gem
gem:
	sudo gem update && \
	sudo gem update --system && \
	sudo gem cleanup

.PHONY: brew
brew:
	brew update && \
	brew upgrade && \
	brew cask upgrade && \
	brew cleanup

.PHONY: node
node:
	fnm install latest && \
	fnm use latest && \
	npm install -g yarn bs-platform && \
	npm update -g
