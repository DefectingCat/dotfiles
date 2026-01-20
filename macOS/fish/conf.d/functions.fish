function mac-update
    brew update && brew upgrade && brew cleanup &&
        rustup update && rustup self update && vim-update
end
