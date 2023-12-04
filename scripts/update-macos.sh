#!/bin/bash
source ./scripts/bash.sh

# zsh
backup_folder ./zsh/zshrc ~/.zshrc

# neovim
backup_folder ./nvim/lua/custom ~/.config/nvim/lua/ ~/.config/nvim/lua/custom/
