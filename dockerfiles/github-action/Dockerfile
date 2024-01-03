FROM archlinux

ARG USER=xfy
ARG RUNNER_VERSION=2.311.0

RUN pacman -Syu --noconfirm \
  && pacman -S --needed git vim base-devel \
  --noconfirm

RUN useradd --groups wheel --no-create-home --shell /bin/bash ${USER}
WORKDIR /home/${USER}
RUN rm -rf /home/${USER}/dotfiles \
  && rm -rf /home/${USER}/yay

RUN chown -R "${USER}":"${USER}" /home/"${USER}"
USER ${USER}
COPY --chown=${USER} . /home/${USER}/dotfiles
RUN export USER="${USER}" \
  && chmod +x /home/${USER}/dotfiles/scripts/* \
  && /home/${USER}/dotfiles/scripts/install-yay.sh

WORKDIR /home/${USER}/actions-runner
RUN yay --noconfirm \
  yay -S curl \
  curl -o actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
  -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
  tar xzf ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz

