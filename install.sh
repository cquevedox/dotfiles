#!/bin/bash

echo "🚀 Installing Hyprland Rice..."

# Check if stow is installed
if ! command -v stow &> /dev/null; then
	echo "📦 Installing GNU Stow..."
	sudo pacman -S --noconfirm stow
fi

# Backup existing configs
echo "💾 Backing up existing configs..."
mkdir -p ~/.config-backup
[ -d ~/.config/hypr ] && cp -r ~/.config/hypr ~/.config-backup/hypr-$(date +%Y%m%d-%H%M%S)
[ -d ~/.config/ghostty ] && cp -r ~/.config/ghostty ~/.config-backup/ghostty-$(date +%Y%m%d-%H%M%S)
[ -d ~/.config/yazi ] && cp -r ~/.config/yazi ~/.config-backup/yazi-$(date +%Y%m%d-%H%M%S)
[ -d ~/.config/waybar ] && cp -r ~/.config/waybar ~/.config-backup/waybar-$(date +%Y%m%d-%H%M%S)

# Remove existing configs
echo "🗑️ Removing existing configs..."
[ -d ~/.config/hypr ] && rm -rf ~/.config/hypr
[ -d ~/.config/ghostty ] && rm -rf ~/.config/ghostty
[ -d ~/.config/yazi ] && rm -rf ~/.config/yazi
[ -d ~/.config/waybar ] && rm -rf ~/.config/waybar

# Apply dotfiles with Stow
echo "🔗 Creating symlinks..."
cd ~/dotfiles || exit

stow hypr
stow ghostty
stow yazi
stow waybar

echo "✅ Dotfiles installed!"
echo "📝 Old configs backed up to ~/.config-backup/"
echo ""
echo "To reload Hyprland: SUPER + SHIFT + C"
