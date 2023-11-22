FROM archlinux

RUN pacman -Syu --noconfirm \
  && pacman -S --needed base-devel git zsh vim neovim fzf ripgrep --noconfirm

ARG USER=xfy
RUN useradd --groups wheel --no-create-home --shell /bin/zsh ${USER} \
	&& echo "${USER} ALL=(ALL) NOPASSWD:ALL" >/etc/sudoers.d/${USER} \
	&& chmod 0440 /etc/sudoers.d/${USER} \
  && usermod -s "$(which zsh)" ${USER}
USER ${USER}
WORKDIR /home/${USER} 

RUN git clone https://aur.archlinux.org/yay.git
WORKDIR /home/${USER}/yay
RUN makepkg -si --noconfirm

WORKDIR /home/${USER} 
RUN rm -rf yay \
  && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
  && git clone https://github.com/DefectingCat/dotfiles \
  # ohmyzsh
  && chmod +x /home/${USER}/dotfiles/zsh/install.sh \
  && cp -aR /home/${USER}/dotfiles/zsh/zshrc-linux /home/${USER}/.zshrc \
  && /home/${USER}/dotfiles/zsh/install.sh \
  && git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 \
  && cp -aR /home/${USER}/dotfiles/nvim/lua/custom /home/${USER}/.config/nvim/lua/ \
  # nvm
  && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash \
  && export NVM_DIR="/home/${USER}/.nvm" \
  && \. "$NVM_DIR/nvm.sh" \
  && nvm install --lts \
  # rustc
  && curl https://sh.rustup.rs -sSf | sh -s -- -y

ENTRYPOINT ["/bin/zsh"]
