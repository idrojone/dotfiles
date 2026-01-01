#!/bin/bash

REPO_DIR="$HOME/GitHub/dotfiles/Linux"
CONFIG_DIR="$HOME/.config"
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

echo "Installing packages using apt..."
sudo apt update
sudo apt install -y bspwm sxhkd polybar alacritty rofi picom nvim nitrogen neofetch zsh curl wget



echo "Creating backup of existing configuration files..."
mkdir -p "$BACKUP_DIR"
[ -d "$CONFIG_DIR/bspwm" ] && cp -r "$CONFIG_DIR/bspwm" "$BACKUP_DIR"
[ -d "$CONFIG_DIR/polybar" ] && cp -r "$CONFIG_DIR/polybar" "$BACKUP_DIR"
[ -f "$HOME/.zshrc" ] && cp "$HOME/.zshrc" "$BACKUP_DIR"


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
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
cd ~/.local/share/fonts && unzip -o JetBrainsMono.zip && rm JetBrainsMono.zip
fc-cache -fv

echo "All set! Restart your session to see the changes."