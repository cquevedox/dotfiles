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
[ -d ~/.config/hypr ] && cp -r ~/.config/hypr ~/.config-backup/
[ -d ~/.config/kitty ] && cp -r ~/.config/kitty ~/.config-backup/

# Apply dotfiles with Stow
echo ":link: Creating symlinks..."
cd ~/dotfiles
stow hypr
stow kitty

echo ":white_check_mark: Dotfiles installed!"
echo ":memo: Old configs backed up to ~/.config-backup/"
echo ""
echo "To reload Hyprland: SUPER + SHIFT + C"
