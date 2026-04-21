source $HOME/.config/fish/cachyos-config.fish

alias vim="nvim"
alias ll="lsd -lhtrF"
alias vi="/usr/bin/vim"
alias vim-update='nvim --headless "+Lazy! update" +qa'
alias dur="du -h -d 1 2>/dev/null | sort -hr"
alias lg="lazygit"
alias claude="claude --dangerously-skip-permissions"
alias claudeg="claude 'ulw 分析git历史提交格式，提交修改，如果需要分批次提交则分批次'"

set -Ux EDITOR nvim
set -Ux RUSTUP_DIST_SERVER https://mirrors.ustc.edu.cn/rust-static
set -Ux RUSTUP_UPDATE_ROOT https://mirrors.ustc.edu.cn/rust-static/rustup
set -Ux RUSTUP_UPDATE_ROOT https://mirrors.tuna.tsinghua.edu.cn/rustup/rustup
set -Ux RUSTUP_DIST_SERVER https://mirrors.tuna.tsinghua.edu.cn/rustup
set -Ux LANG "en_US.UTF-8"
set -Ux LC_ALL "en_US.UTF-8"
set -Ux COLORTERM truecolor
set -Ux TERM xterm-256color

starship init fish | source

# Go
set -gx GOPATH (go env GOPATH)
set -gx PATH $PATH $GOPATH/bin
