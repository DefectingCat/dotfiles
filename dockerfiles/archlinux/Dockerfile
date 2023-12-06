FROM archlinux

RUN pacman -Syu --noconfirm \
  && pacman -S --needed base-devel git zsh vim neovim fzf ripgrep lazygit go --noconfirm


ARG USER=xfy
RUN useradd --groups wheel --no-create-home --shell /bin/zsh ${USER} \
	&& echo "${USER} ALL=(ALL) NOPASSWD:ALL" >/etc/sudoers.d/${USER} \
  && chmod 0440 /etc/sudoers.d/${USER} \
  && usermod -s "$(which zsh)" ${USER}
WORKDIR /home/${USER} 

COPY ./install.sh .
RUN chmod +x ./install.sh \
  && chown -R "${USER}":"${USER}" /home/"${USER}"

USER ${USER}
RUN export USER="${USER}" \
  && ./install.sh

ENTRYPOINT ["/bin/zsh"]
