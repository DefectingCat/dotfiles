#!/bin/bash

# $1 source $2 target $3 remove old
function backup_folder() {
	if [ "$3" ]; then
		rm -rf "$3"
	fi

	cp -aR "$1" "$2"
}

# neovim
backup_folder ~/.config/nvim/lua/custom ./nvim/lua/ ./nvim/lua/custom/

# kitty
backup_folder ~/.config/kitty/ ./ ./kitty/

# neofetch
backup_folder ~/.config/neofetch ./ ./neofetch/

# zshrc
backup_folder ~/.zshrc ./zsh/zshrc

# ranger
backup_folder ~/.config/ranger ./ ./ranger/

# tmux
backup_folder ~/.tmux/tmux.conf ./tmux/ ./tmux/tmux.conf

# lazygit
backup_folder ~/.config/lazygit ./ ./lazygit/

# yabai
backup_folder ~/.config/yabai ./ ./yabai/

# skhd
backup_folder ~/.config/skhd ./ ./skhd/

# sketchybar
backup_folder ~/.config/sketchybar ./ ./sketchybar/
