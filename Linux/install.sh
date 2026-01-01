#!/bin/bash

REPO_DIR="$HOME/GitHub/dotfiles/Linux"
CONFIG_DIR="$HOME/.config"

echo "Starting clean installation of Dotfiles..."

echo "Configuring repositories and packages..."
sudo apt update
sudo apt install -y software-properties-common curl wget git unzip
sudo add-apt-repository -y ppa:aslatter/ppa
sudo apt update

sudo apt install -y bspwm sxhkd polybar alacritty rofi picom nvim nitrogen neofetch zsh

echo "Installing Oh-My-Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# 4. Copia de archivos del Repo al Sistema
echo "Copying configuration files..."

mkdir -p "$CONFIG_DIR/bspwm" "$CONFIG_DIR/sxhkd" "$CONFIG_DIR/polybar" "$CONFIG_DIR/alacritty" "$CONFIG_DIR/rofi" "$CONFIG_DIR/nvim"

cp -r "$REPO_DIR/bspwm/." "$CONFIG_DIR/bspwm/"
cp -r "$REPO_DIR/sxhkd/." "$CONFIG_DIR/sxhkd/"
cp -r "$REPO_DIR/polybar/." "$CONFIG_DIR/polybar/"
cp -r "$REPO_DIR/alacritty/." "$CONFIG_DIR/alacritty/"
cp -r "$REPO_DIR/rofi/." "$CONFIG_DIR/rofi/"
cp -r "$REPO_DIR/nvim/." "$CONFIG_DIR/nvim/"

cp "$REPO_DIR/.zshrc" "$HOME/.zshrc"
cp "$REPO_DIR/.Xdefaults" "$HOME/.Xdefaults" 2>/dev/null

echo "Installing Nerd Font..."
mkdir -p ~/.local/share/fonts
wget -q --show-progress https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
unzip -o JetBrainsMono.zip -d ~/.local/share/fonts
rm JetBrainsMono.zip
fc-cache -fv

echo ""