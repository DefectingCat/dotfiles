FROM ubuntu:noble

RUN sed -i 's@//.*archive.ubuntu.com@//mirrors.tuna.tsinghua.edu.cn@g' /etc/apt/sources.list.d/ubuntu.sources \
  && sed -i 's@//.*security.ubuntu.com@//mirrors.tuna.tsinghua.edu.cn@g' /etc/apt/sources.list.d/ubuntu.sources \
  && apt-get update -y \
  && apt-get install -y git ninja-build gettext cmake unzip curl build-essential sudo zsh htop \
  && cd /opt && git clone --depth 1 https://gitee.com/mirrors/neovim && cd neovim \
  && make CMAKE_BUILD_TYPE=Release \
  && make install \
  && rm -rf neovim \
  && rm -rf /var/lib/apt/lists/*

ARG USER=xfy
RUN useradd --groups sudo --no-create-home --shell /bin/bash ${USER} \
  && echo "${USER} ALL=(ALL) NOPASSWD:ALL" >/etc/sudoers.d/${USER} \
  && chmod 0440 /etc/sudoers.d/${USER} \
  && usermod -s "$(which zsh)" ${USER}
USER ${USER}
WORKDIR /home/${USER}
RUN git clone https://github.com/DefectingCat/dotfiles
# ohmyzsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN cp -a /home/${USER}/dotfiles/zsh/zshrc /home/${USER}/.zshrc
RUN cp -a /home/${USER}/dotfiles/zsh/p10k.zsh /home/${USER}/.p10k.zsh
RUN bash /home/${USER}/dotfiles/zsh/install-plugins.sh
# node
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
RUN export NVM_DIR="/home/$USER/.nvm" \
  && \. "$NVM_DIR/nvm.sh" \
  && nvm install --lts \
  && npm i -g yarn pnpm cgr
# rustup
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
# golang
RUN git clone https://github.com/go-nv/goenv.git /home/${USER}/.goenv \
  && /home/${USER}/.goenv/bin/goenv install 1.22.2 \
  && /home/${USER}/.goenv/bin/goenv global 1.22.2
# lazygit
RUN LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*') \
  && curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" \
  && mkdir -p /home/${USER}/.config/lazygit \
  && cp -a /home/${USER}/dotfiles/lazygit/mocha-pink.yml /home/${USER}/.config/lazygit
RUN tar zvxf lazygit.tar.gz lazygit
RUN sudo install lazygit /usr/local/bin \
  && rm -rf lazygit \
  && rm -rf lazygit.tar.gz

ENTRYPOINT ["/bin/zsh"]
