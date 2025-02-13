FROM ubuntu:noble

RUN sed -i 's@//.*archive.ubuntu.com@//mirrors.tuna.tsinghua.edu.cn@g' /etc/apt/sources.list.d/ubuntu.sources \
    && sed -i 's@//.*security.ubuntu.com@//mirrors.tuna.tsinghua.edu.cn@g' /etc/apt/sources.list.d/ubuntu.sources \
    && apt-get update -y \
    && apt-get install -y git ninja-build gettext cmake unzip curl build-essential sudo zsh htop vim \
    python3 python3-pip \
    # install neovim
    && cd /opt && git clone --depth 1 https://gitee.com/mirrors/neovim && cd neovim \
    && make CMAKE_BUILD_TYPE=Release \
    && make install \
    && rm -rf neovim \
    && rm -rf /var/lib/apt/lists/*

ARG USER=xfy

RUN useradd --groups sudo --no-create-home --shell /bin/zsh ${USER} \
    && echo "${USER} ALL=(ALL) NOPASSWD:ALL" >/etc/sudoers.d/${USER} \
    && chmod 0440 /etc/sudoers.d/${USER}
# RUN usermod -o -u ${USER_ID} ${USER}
# RUN usermod -g ${USER_ID} ${USER}
USER ${USER}
WORKDIR /home/${USER}

RUN git clone https://github.com/DefectingCat/dotfiles \
    # onmyzsh
    && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"  \
    && rm -rf /home/${USER}/.zshrc  \
    && ln -s /home/${USER}/dotfiles/zsh/zshrc /home/${USER}/.zshrc  \
    && ln -s /home/${USER}/dotfiles/zsh/p10k.zsh /home/${USER}/.p10k.zsh  \
    && bash /home/${USER}/dotfiles/zsh/install-plugins.sh  \
    # neovim config
    && git clone https://github.com/DefectingCat/nvim /home/${USER}/.config/nvim \
    # && nvim --headless "+Lazy! install" +MasonInstallAll +qa \
    && nvim --headless "+Lazy! install" +qa \
    && nvim --headless "+Lazy! sync" +qa
# node
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash \
    && export NVM_DIR="/home/$USER/.nvm" \
    && \. "$NVM_DIR/nvm.sh" \
    && nvm install --lts \
    && npm i -g yarn pnpm cgr \
    # rustup
    && curl https://sh.rustup.rs -sSf | sh -s -- -y \
    # golang
    && git clone https://github.com/go-nv/goenv.git /home/${USER}/.goenv \
    && /home/${USER}/.goenv/bin/goenv install 1.22.2 \
    && /home/${USER}/.goenv/bin/goenv global 1.22.2
# lazygit
RUN LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*') \
    && curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" \
    && mkdir -p /home/${USER}/.config/lazygit \
    && tar zvxf lazygit.tar.gz lazygit \
    && sudo install lazygit /usr/local/bin \
    && rm -rf lazygit \
    && rm -rf lazygit.tar.gz
# pypi tsinghua
RUN pip config set global.index-url https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple
# python3 -m pip install -i https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple --upgrade pip \

ENTRYPOINT ["/bin/zsh"]
