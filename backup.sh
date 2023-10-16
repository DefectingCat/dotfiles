#!/bin/bash

rm -rf .config/nvim
cp -aR ~/.config/nvim ./

rm -rf .config/kitty
cp -aR ~/.config/kitty ./

rm -rf .config/neofetch
cp -aR ~/.config/neofetch ./

cp -a ~/.zshrc .zsh/

rm -rf .config/ranger
cp -aR ~/.config/ranger ./

rm -rf .config/tmux/tmux.conf
cp -aR ~/.tmux/tmux.conf .tmux
