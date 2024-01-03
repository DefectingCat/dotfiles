#!/bin/bash

cd /home/"$USER"/ || exit
git clone https://aur.archlinux.org/yay.git
cd /home/"$USER"/yay || exit
makepkg -si --noconfirm
cd /home/"$USER"/ || exit
rm -rf yay
echo "install yay success"
