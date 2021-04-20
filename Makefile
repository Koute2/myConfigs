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

.PHONY: remove-mysql
remove-mysql:
	-sudo rm /usr/local/mysql && \
	-sudo rm -rf /usr/local/var/mysql && \
	-sudo rm -rf /usr/local/mysql* && \
	-sudo rm ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist && \
	-sudo rm -rf /Library/StartupItems/MySQLCOM && \
	-sudo rm -rf /Library/PreferencePanes/My* && \
	-launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist && \
	-rm -rf ~/Library/PreferencePanes/My* && \
	-sudo rm -rf /Library/Receipts/mysql* && \
	-sudo rm -rf /Library/Receipts/MySQL* && \
	-sudo rm -rf /private/var/db/receipts/*mysql*

.PHONY: setup
setup:
	brew install fnm fzf koekeishiya/formulae/skhd koekeishiya/formulae/yabai starship && \
	brew tap homebrew/cask-fonts && \
	brew install --cask alacritty avibrazil-rdm onyx font-fira-code-nerd-font font-fira-mono-nerd-font
