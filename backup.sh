#!/bin/bash
rm -rf ./nvim/lua/custom
cp -aR ~/.config/nvim/lua/custom ./nvim/lua/

rm -rf ./kitty
cp -aR ~/.config/kitty ./

rm -rf ./neofetch
cp -aR ~/.config/neofetch ./

cp -aR ~/.zshrc zsh/zshrc

rm -rf ./ranger
cp -aR ~/.config/ranger ./

rm -rf ./tmux/tmux.conf
cp -aR ~/.tmux/tmux.conf ./tmux

rm -rf ./lazygit/
cp -aR ~/.config/lazygit ./

rm -rf ./yabai/
cp -aR ~/.config/yabai ./

rm -rf ./skhd/
cp -aR ~/.config/skhd ./

rm -rf ./sketchybar/
cp -aR ~/.config/sketchybar ./
