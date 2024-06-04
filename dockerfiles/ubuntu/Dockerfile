FROM ubuntu:noble

RUN sed -i 's@//.*archive.ubuntu.com@//mirrors.tuna.tsinghua.edu.cn@g' /etc/apt/sources.list.d/ubuntu.sources \
  && sed -i 's@//.*security.ubuntu.com@//mirrors.tuna.tsinghua.edu.cn@g' /etc/apt/sources.list.d/ubuntu.sources \
  && apt-get update -y \
  && apt-get install -y git ninja-build gettext cmake unzip curl build-essential sudo \
  && cd /opt && git clone --depth 1 https://gitee.com/mirrors/neovim && cd neovim \
  && make CMAKE_BUILD_TYPE=Release \
  && make install \
  && rm -rf neovim \
  && rm -rf /var/lib/apt/lists/*

ARG USER=xfy
RUN useradd --groups sudo --no-create-home --shell /bin/bash ${USER} \
  && echo "${USER} ALL=(ALL) NOPASSWD:ALL" >/etc/sudoers.d/${USER} \
  && chmod 0440 /etc/sudoers.d/${USER}
USER ${USER}
WORKDIR /home/${USER}
