#!/bin/bash

rm -rf .config/nvim
cp -aR ~/.config/nvim .config/

rm -rf .config/kitty
cp -aR ~/.config/kitty .config/

rm -rf .config/neofetch
cp -aR ~/.config/neofetch .config/

cp -a ~/.zshrc .config/zsh/

rm -rf .config/ranger
cp -aR ~/.config/ranger .config/

rm -rf .config/tmux/tmux.conf
cp -aR ~/.tmux/tmux.conf .config/tmux
