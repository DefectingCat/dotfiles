#!/bin/bash

rm -rf nvim
cp -aR ~/.config/nvim ./

rm -rf kitty
cp -aR ~/.config/kitty ./

rm -rf neofetch
cp -aR ~/.config/neofetch ./

cp -a ~/.zshrc zsh/

rm -rf ranger
cp -aR ~/.config/ranger ./

rm -rf tmux/tmux.conf
cp -aR ~/.tmux/tmux.conf tmux

rm -rf vim/.ideavimrc
cp -aR ~/.ideavimrc vim
