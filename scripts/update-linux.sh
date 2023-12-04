#!/bin/bash
source ./scripts/bash.sh

# zsh
backup_folder ./zsh/zshrc-linux ~/.zshrc

# neovim
backup_folder ./nvim/lua/custom ~/.config/nvim/lua/ ~/.config/nvim/lua/custom/

# lazygit
backup_folder ./lazygit ~/.config/

# kitty
