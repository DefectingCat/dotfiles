#!/bin/bash
source ./scripts/bash.sh
# zsh
backup_folder ./zsh/zshrc ~/.zshrc
backup_folder ./zsh/p10k.zsh ~/.p10k.zsh
# neovim
backup_folder ./nvim/lua/custom ~/.config/nvim/lua/ ~/.config/nvim/lua/custom/
# neofetch
backup_folder ./neofetch ~/.config/ ~/.config/neofetch/
# ranger
backup_folder ./ranger ~/.config/ ~/.config/ranger/
# lazygit
backup_folder ./lazygit ~/.config/ ~/.config/lazygit/
# bash scripts
backup_folder ./rua-scripts ~/.config/
# btop
backup_folder ./btop ~/.config/
# tmux
backup_folder ./tmux/tmux.conf ~/.tmux/
backup_folder ./tmux/renew_env.sh ~/.tmux/
backup_folder ./tmux/tmux.remote.conf ~/.tmux/
backup_folder ./tmux/yank.sh ~/.tmux/

if [[ $OSTYPE == "linux"* ]]; then
	# hyprland
	backup_folder ./hypr ~/.config/
fi

if [[ $OSTYPE == "darwin"* ]]; then
	# kitty
	backup_folder ./kitty ~/.config/
	# yabai
	backup_folder ./yabai ~/.config/ ~/.config/yabai/
	# skhd
	backup_folder ./skhd ~/.config/ ~/.config/skhd/
	# sketchybar
	backup_folder ./sketchybar ~/.config/ ~/.config/sketchybar
fi
