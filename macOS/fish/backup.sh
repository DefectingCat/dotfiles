#!/bin/sh
echo "Copying Fish configuration files..."
cp -a "$HOME"/.config/fish/config.fish macOS/fish/
cp -a "$HOME"/.config/fish/private_env_example.fish macOS/fish/
cp -a "$HOME"/.config/fish/conf.d/git.fish macOS/fish/conf.d/
echo "Done"
