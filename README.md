# Cristian Quevedo Dotfiles - Hyprland
Personal dotfiles for Arch Linux with Hyprland compositor.

## 🖼️ Preview
> Screenshots coming soon...

## ✨ Features
- 🪟 **Hyprland** - Modern Wayland compositor
- 📊 **Waybar** - Customized status bar
- 🔔 **Swaync** - Notification Center
- 📁 **Yazi** - Modern TUI file manager
- 🐚 **ZSH + Oh My Zsh** - Enhanced shell experience
- 🎨 **Tokyo Night** - Consistent color scheme across all apps

## 📦 Stack
- **Display Server**: Wayland
- **Compositor**: Hyprland
- **Terminal**: Ghostty
- **Shell**: ZSH + Oh My Zsh
- **Bar**: Waybar
- **Notifications**: Swaync
- **File Manager**: Yazi (TUI) + Thunar (GUI)
- **Launcher**: Rofi (pending)
- **Theme**: Tokyo Night (for a moment)

## 🚀 Installation

### Prerequisites
1. Complete Arch base installation.
2. Install Wayland, drivers, audio, Hyprland, etc.

### Quick Install
```zsh
git clone https://github.com/cquevedox/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

## 📂 Structure
```
.
├── hypr/          # Hyprland configuration
├── waybar/        # Waybar config & styles
├── ghostty/       # Ghostty terminal config
├── yazi/          # Yazi file manager config
├── zsh/           # ZSH configuration
└── install.sh     # Automated installation script
```

## ⚙️ Manual Installation
If you prefer manual setup:
```zsh
cd ~/dotfiles
stow hypr
stow waybar
stow ghostty
stow yazi
stow zsh
```

## 🔄 Updating
```zsh
cd ~/dotfiles
git pull
stow hypr waybar ghostty yazi zsh
```

## 🤝 Credits
- Color scheme: [Tokyo Night](https://github.com/tokyo-night/tokyo-night-vscode-theme)

## 📄 License
MIT License - Feel free to use and modify

---
⭐ If you find this useful, consider starring the repo!
