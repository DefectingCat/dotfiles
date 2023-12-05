#!/bin/bash

# $1 git path $2 target directory
function install_plugin {
	if [ ! -d "$2" ]; then
		echo "install $1"
		git clone --depth=1 "$1" "$2"
	else
		cd "$2" || exit
		echo "update $1"
		git pull
	fi
}

install_plugin https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/plugins/zsh-syntax-highlighting
install_plugin https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/plugins/zsh-autosuggestions
install_plugin https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/themes/powerlevel10k
install_plugin https://github.com/jeffreytse/zsh-vi-mode "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/plugins/zsh-vi-mode
echo "Done."
