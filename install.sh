#!/bin/bash

echo ":rocket: Installing Hyprland Rice..."

# Check if stow is installed
if ! command -v stow &> /dev/null; then
	echo "Installing GNU Stow..."
	sudo pacman -S --noconfirm stow
fi

# Backup existing configs
echo ":floppy_disk: Backing up existing configs..."
mkdir -p ~/.config-backup
[ -d ~/.config/hypr ] && cp -r ~/.config/hypr ~/.config-backup/hypr-$(date +%Y%m%d-%H%M%S)
[ -d ~/.config/kitty ] && cp -r ~/.config/kitty ~/.config-backup/kitty-$(date +%Y%m%d-%H%M%S)
[ -d ~/.config/ghostty ] && cp -r ~/.config/ghostty ~/.config-backup/ghostty-$(date +%Y%m%d-%H%M%S)

# Remove existing configs
echo "\U1D5D1 Removing existing configs..."
[ -d ~/.config/hypr ] && rm -rf ~/.config/hypr
[ -d ~/.config/kitty ] && rm -rf ~/.config/kitty
[ -d ~/.config/ghostty ] && rm -rf ~/.config/ghostty

# Apply dotfiles with Stow
echo ":link: Creating symlinks..."
cd ~/dotfiles
stow hypr
stow ghostty
# stow kitty

echo ":white_check_mark: Dotfiles installed!"
echo ":memo: Old configs backed up to ~/.config-backup/"
echo ""
echo "To reload Hyprland: SUPER + SHIFT + C"
