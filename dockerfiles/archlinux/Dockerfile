FROM archlinux

RUN echo '' > /etc/pacman.d/mirrorlist \
  && echo 'Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist \
  && pacman -Syyu --noconfirm \
  && pacman-key --init \
  && pacman-key --populate archlinux \
  && pacman-key --refresh-keys \
  && pacman -Syy --needed base-devel git zsh vim neovim fzf \
  ripgrep lazygit go ranger openssh pyenv \
  --noconfirm

ARG USER=xfy
RUN useradd --groups wheel --no-create-home --shell /bin/zsh ${USER} \
  && echo "${USER} ALL=(ALL) NOPASSWD:ALL" >/etc/sudoers.d/${USER} \
  && chmod 0440 /etc/sudoers.d/${USER} \
  && usermod -s "$(which zsh)" ${USER}
WORKDIR /home/${USER}
RUN rm -rf /home/${USER}/dotfiles \
  && rm -rf /home/${USER}/yay

RUN chown -R "${USER}":"${USER}" /home/"${USER}"
USER ${USER}
COPY --chown=${USER} . /home/${USER}/dotfiles
RUN export USER="${USER}" \
  && chmod +x /home/${USER}/dotfiles/scripts/* \
  && /home/${USER}/dotfiles/scripts/install-yay.sh \
  && /home/${USER}/dotfiles/scripts/install-archlinux.sh \
  && yay --noconfirm

WORKDIR /home/${USER}

ENTRYPOINT ["/bin/zsh"]
