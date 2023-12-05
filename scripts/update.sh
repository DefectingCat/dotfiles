#!/bin/bash
source ./scripts/bash.sh

# zsh
backup_folder ./zsh/zshrc ~/.zshrc

# neovim
backup_folder ./nvim/lua/custom ~/.config/nvim/lua/ ~/.config/nvim/lua/custom/

# kitty
if [[ $OSTYPE == "darwin"* ]]; then
	backup_folder ./kitty ~/.config/
fi

# neofetch
backup_folder ./neofetch ~/.config/ ~/.config/neofetch/

# ranger
backup_folder ./ranger ~/.config/ ~/.config/ranger/

# lazygit
backup_folder ./lazygit ~/.config/ ~/.config/lazygit/

# bash scripts
backup_folder ./rua-scripts ~/.config/

if [[ $OSTYPE == "darwin"* ]]; then
	# yabai
	backup_folder ./yabai ~/.config/ ~/.config/yabai/
	# skhd
	backup_folder ./skhd ~/.config/ ~/.config/skhd/
	# sketchybar
	backup_folder ./sketchybar ~/.config/ ~/.config/sketchybar
fi
