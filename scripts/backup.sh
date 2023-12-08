#!/bin/bash
source ./scripts/bash.sh
# neovim
backup_folder ~/.config/nvim/lua/custom ./nvim/lua/ ./nvim/lua/custom/
# neofetch
backup_folder ~/.config/neofetch ./ ./neofetch/
# zshrc
backup_folder ~/.zshrc ./zsh/zshrc
backup_folder ~/.p10k.zsh ./zsh/p10k.zsh
# ranger
backup_folder ~/.config/ranger ./ ./ranger/
# tmux
backup_folder ~/.tmux/tmux.conf ./tmux/ ./tmux/tmux.conf
# bash scripts
backup_folder ~/.config/rua-scripts ./ ./rua-scripts
# lazygit
backup_folder ~/.config/lazygit ./ ./lazygit/
# btop
backup_folder ~/.config/btop ./ ./btop

if [[ $OSTYPE == "linux"* ]]; then
	# hyprland
	backup_folder ~/.config/hypr ./ ./hypr
fi

if [[ $OSTYPE == "darwin"* ]]; then
	# kitty
	backup_folder ~/.config/kitty ./ ./kitty/
	# yabai
	backup_folder ~/.config/yabai ./ ./yabai/
	# skhd
	backup_folder ~/.config/skhd ./ ./skhd/
	# sketchybar
	backup_folder ~/.config/sketchybar ./ ./sketchybar/
fi
