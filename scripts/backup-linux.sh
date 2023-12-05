#!/bin/bash
source ./scripts/bash.sh

# neovim
backup_folder ~/.config/nvim/lua/custom ./nvim/lua/ ./nvim/lua/custom/

# zsh
backup_folder ~/.zshrc ./zsh/zshrc-linux
# bash scripts
backup_folder ~/.config/rua-scripts/ ./rua-scripts
