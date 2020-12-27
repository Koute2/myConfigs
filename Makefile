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
