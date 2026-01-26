source $HOME/.config/fish/cachyos.fish

eval "$(/opt/homebrew/bin/brew shellenv)"

alias vim="nvim"
alias icat="kitty +kitten icat"
alias kssh="kitty +kitten ssh"
# alias ll="ls -lhtr"
alias ll="lsd -lhtrF"
alias vi="/usr/bin/vim"
alias vim="nvim"
alias vim-update='nvim --headless "+Lazy! update" +qa'
# alias nvim-update='nvim --headless "+Lazy! sync" +qa'
alias x86="env /usr/bin/arch -x86_64 /bin/zsh --login"
alias arm="env /usr/bin/arch -arm64 /bin/zsh --login"
alias dur="du -h -d 1 2>/dev/null | sort -hr"
alias lg="lazygit"

set -Ux EDITOR nvim
# set -Ux http_proxy "socks5://127.0.0.1:13659"
# set -Ux https_proxy "socks5://127.0.0.1:13659"
set -Ux http_proxy "http://127.0.0.1:10808"
set -Ux https_proxy "http://127.0.0.1:10808"
set -Ux RUSTUP_DIST_SERVER https://mirrors.ustc.edu.cn/rust-static
set -Ux RUSTUP_UPDATE_ROOT https://mirrors.ustc.edu.cn/rust-static/rustup
set -Ux RUSTUP_UPDATE_ROOT https://mirrors.tuna.tsinghua.edu.cn/rustup/rustup
set -Ux RUSTUP_DIST_SERVER https://mirrors.tuna.tsinghua.edu.cn/rustup
set -Ux HOMEBREW_BREW_GIT_REMOTE "https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
set -Ux HOMEBREW_CORE_GIT_REMOTE "https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
set -Ux HOMEBREW_INSTALL_FROM_API 1
set -Ux LANG "en_US.UTF-8"
set -Ux LC_ALL "en_US.UTF-8"
set -Ux COLORTERM truecolor
set -Ux TERM xterm-256color

starship init fish | source
