#!/bin/bash

# Output colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}🚀 Installing Hyprland Rice...${NC}"
echo ""

# Check if stow is installed
if ! command -v stow &> /dev/null; then
	echo -e "${YELLOW}📦 Installing GNU Stow...${NC}"
	sudo pacman -S --noconfirm stow
fi

# Backup existing configs
echo -e "${BLUE}💾 Backing up existing configs...${NC}"
BACKUP_DIR="$HOME/.config-backup/$(date +%Y%m%d-%H%M%S)"
mkdir -p "$BACKUP_DIR"

for config in hypr ghostty yazi waybar zsh; do
	if [ -d "$HOME/.config/$config" ]; then
		echo -e "${YELLOW}  Backing up $config...${NC}"
		cp -r "$HOME/.config/$config" "$BACKUP_DIR/"
	fi
done

# .zshrc
if [ -f "$HOME/.zshrc" ]; then
	echo -e "${YELLOW}  Backing up .zshrc...${NC}"
	cp "$HOME/.zshrc" "$BACKUP_DIR/"
fi

# Remove existing configs
echo -e "${BLUE}🗑️ Removing existing configs...${NC}"
[ -d ~/.config/hypr ] && rm -rf ~/.config/hypr
[ -d ~/.config/ghostty ] && rm -rf ~/.config/ghostty
[ -d ~/.config/yazi ] && rm -rf ~/.config/yazi
[ -d ~/.config/waybar ] && rm -rf ~/.config/waybar
[ -f ~/.zshrc ] && rm -f ~/.zshrc

# Apply dotfiles with Stow
echo -e "${BLUE}🔗 Creating symlinks...${NC}"
cd ~/dotfiles || exit

stow hypr
stow ghostty
stow yazi
stow waybar
stow zsh

echo ""
echo -e "${GREEN}✅ Dotfiles installed successfully!${NC}"
echo -e "${BLUE}📝 Old configs backed up to: ${BACKUP_DIR}${NC}"
echo ""
echo -e "${YELLOW}📌 Next steps:${NC}"
echo -e "  1. Reload Hyprland: ${BLUE}SUPER + SHIFT + C${NC}"
echo -e "  2. Reload ZSH: ${BLUE}source ~/.zshrc${NC}"
echo -e "  3. Install missing dependencies if any"
echo ""
echo -e "${GREEN}Enjoy your new rice! 🍚${NC}"
