#!/bin/bash

# install yay
cd /home/"$USER"/ || exit
git clone https://aur.archlinux.org/yay.git
cd /home/"$USER"/yay || exit
makepkg -si --noconfirm
echo "install yay success"

cd /home/"$USER"/ || exit
rm -rf yay
git clone https://github.com/DefectingCat/dotfiles

## ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chmod +x /home/"$USER"/dotfiles/zsh/install-plugins.sh
/home/"$USER"/dotfiles/zsh/install-plugins.sh
chmod +x /home/"$USER"/dotfiles/scripts/update.sh
/home/"$USER"/dotfiles/scripts/update.sh

# neovim
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
export NVM_DIR="/home/$USER/.nvm"
\. "$NVM_DIR/nvm.sh"
nvm install --lts
# rustc
curl https://sh.rustup.rs -sSf | sh -s -- -y
