#!/usr/bin/env bash
set -e

echo "=== Installing fonts ==="

# 1. JetBrains Mono
if ! dpkg -s fonts-jetbrains-mono &>/dev/null; then
    echo "Installing JetBrains Mono via apt..."
    sudo apt install -y fonts-jetbrains-mono || {
        echo "apt failed, falling back to manual install..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"
    }
else
    echo "JetBrains Mono already installed, skipping."
fi

# 2. Fira Code
if ! dpkg -s fonts-firacode &>/dev/null; then
    echo "Installing Fira Code via apt..."
    sudo apt install -y fonts-firacode || {
        echo "apt failed, falling back to manual install..."
        mkdir -p ~/.local/share/fonts
        wget -q https://github.com/tonsky/FiraCode/releases/download/6.2/Fira_Code_v6.2.zip -O /tmp/firacode.zip
        unzip -o /tmp/firacode.zip -d ~/.local/share/fonts/
        rm /tmp/firacode.zip
    }
else
    echo "Fira Code already installed, skipping."
fi

# 3. Font Awesome (если нужна версия 4 из репозитория)
if ! dpkg -s fonts-font-awesome &>/dev/null; then
    echo "Installing Font Awesome via apt..."
    sudo apt install -y fonts-font-awesome
else
    echo "Font Awesome already installed, skipping."
fi

# 4. Дополнительно: Symbols Nerd Font (для иконок в kitty/Neovim, очень рекомендуется)
# Это самый лёгкий способ решить проблему с иконками, не нужно менять моноширинный шрифт
if ! fc-list | grep -qi "Symbols Nerd Font"; then
    echo "Installing Symbols Nerd Font..."
    mkdir -p ~/.local/share/fonts
    wget -q https://github.com/ryanoasis/nerd-fonts/releases/latest/download/NerdFontsSymbolsOnly.zip -O /tmp/nerd-symbols.zip
    unzip -o /tmp/nerd-symbols.zip -d ~/.local/share/fonts/
    rm /tmp/nerd-symbols.zip
else
    echo "Symbols Nerd Font already installed, skipping."
fi

# Обновление кэша шрифтов
echo "Updating font cache..."
fc-cache -fv

echo "=== Fonts installation done ==="

# Install nodejs
sudo apt install nodejs npm

# Install python
sudo apt install python3-venv python3-pip

