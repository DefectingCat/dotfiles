#!/bin/bash

# install yay
cd /home/"$USER"/ || exit
git clone https://aur.archlinux.org/yay.git
cd /home/"$USER"/yay || exit
makepkg -si --noconfirm
rm -rf yay
echo "install yay success"

cd /home/"$USER"/ || exit

# ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chmod +x /home/"$USER"/dotfiles/zsh/install-plugins.sh
/home/"$USER"/dotfiles/zsh/install-plugins.sh

# neovim
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
echo "install neovim done"
# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
export NVM_DIR="/home/$USER/.nvm"
\. "$NVM_DIR/nvm.sh"
nvm install --lts
echo "install nvm done"
# rustc
curl https://sh.rustup.rs -sSf | sh -s -- -y
echo "install rustup done"

chmod +x /home/"$USER"/dotfiles/scripts/update.sh
/home/"$USER"/dotfiles/scripts/update.sh
echo "install all done"
