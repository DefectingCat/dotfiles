# fnm configuration for fish shell

# Set fnm directory
set -q FNM_DIR; or set -gx FNM_DIR "$HOME/.local/share/fnm"

# Add fnm to PATH if not already present
if not contains "$FNM_DIR" $PATH
    set -gx PATH "$FNM_DIR" $PATH
end

# Set Taobao mirror for faster downloads in China
set -gx FNM_NODE_DIST_MIRROR "https://npmmirror.com/mirrors/node"

# Optional: You can also use other Chinese mirrors:
# set -gx FNM_NODE_DIST_MIRROR "https://mirrors.tuna.tsinghua.edu.cn/nodejs-release"
# set -gx FNM_NODE_DIST_MIRROR "https://cdn.npmmirror.com/binaries/node"

# Set other fnm environment variables
set -gx FNM_VERSION_FILE_STRATEGY "local"
set -gx FNM_LOGLEVEL "info"
set -gx FNM_COREPACK_ENABLED "false"
set -gx FNM_RESOLVE_ENGINES "true"

# Initialize fnm
if command -q fnm
    # Use fnm env with automatic version switching on directory change
    fnm env --use-on-cd --shell fish | source
else
    echo "fnm is not installed. Please install it first."
    echo "You can install it using:"
    echo "  brew install fnm"
    echo "  or"
    echo "  curl -fsSL https://fnm.vercel.app/install | bash"
end

# Aliases for fnm
alias nvm="fnm"
alias node-list="fnm list"
alias node-use="fnm use"
alias node-install="fnm install"
alias node-uninstall="fnm uninstall"
alias node-default="fnm default"
alias node-current="fnm current"

# Helper function to quickly switch Node.js versions
function node-switch
    if test (count $argv) -eq 0
        echo "Usage: node-switch <version>"
        echo "Available versions:"
        fnm list
        return 1
    end

    fnm use $argv[1]
end

# Helper function to install and use a Node.js version
function node-get
    if test (count $argv) -eq 0
        echo "Usage: node-get <version>"
        echo "Examples:"
        echo "  node-get 20"
        echo "  node-get 18.19.0"
        echo "  node-get lts"
        return 1
    end

    fnm install $argv[1]
    fnm use $argv[1]
end

# Auto-completion for fnm
if command -q fnm
    complete -c fnm -f -a "(fnm completions --shell fish)"
end
