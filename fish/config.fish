# source /usr/share/cachyos-fish-config/cachyos-config.fish
source $HOME/.config/fish/cachyos.fish
source $HOME/.config/fish/git.fish

set -Ux http_proxy "http://192.168.149.1:7890"
set -Ux https_proxy "http://192.168.149.1:7890"

alias vim="nvim"

# overwrite greeting
# potentially disabling fastfetch
# function fish_greeting
#    # smth smth
# end
