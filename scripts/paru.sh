#!/bin/bash

set -e
set -o pipefail

# 🖍️ Colors
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
NC="\033[0m"

echo -e "${BLUE}🔄 Syncing and updating AUR packages...${NC}"
paru -Syu --noconfirm

# --- Developer Tools ---
echo -e "${YELLOW}💻 Developer Tools:${NC}"

read -p "$(echo -e ${YELLOW}"Do you want to install Eclipse? (y/n): "${NC})" install_eclipse
[[ "$install_eclipse" =~ ^[Yy]$ ]] && paru -S --needed --noconfirm eclipse-java-bin

read -p "$(echo -e ${YELLOW}"Do you want to install Postman? (y/n): "${NC})" install_postman
[[ "$install_postman" =~ ^[Yy]$ ]] && paru -S --needed --noconfirm postman-bin

read -p "$(echo -e ${YELLOW}"Do you want to install JetBrains Toolbox? (y/n): "${NC})" install_jetbrains
[[ "$install_jetbrains" =~ ^[Yy]$ ]] && paru -S --needed --noconfirm jetbrains-toolbox

# --- Productivity Apps ---
echo -e "${YELLOW}📦 Productivity Apps:${NC}"

read -p "$(echo -e ${YELLOW}"Do you want to install Notion desktop apps? (y/n): "${NC})" install_notion
if [[ "$install_notion" =~ ^[Yy]$ ]]; then
  paru -S --needed --noconfirm \
    notion-desktop-git \
    notion-calender-election
fi

paru -S --needed --noconfirm spotify discord

# --- Terminal Emulator ---
echo -e "${YELLOW}🖥️ Terminal Emulator Choice:${NC}"
echo -e "${YELLOW}Options: [1] WezTerm [2] Kitty [3] Ghostty [4] Alacritty${NC}"
read -p "$(echo -e ${YELLOW}"Choose your terminal emulator (1-4): "${NC})" term_choice

case "$term_choice" in
  1) paru -S --needed --noconfirm wezterm-git ;;
  2) paru -S --needed --noconfirm kitty ;;
  3) paru -S --needed --noconfirm ghostty-bin ;;
  4) paru -S --needed --noconfirm alacritty ;;
  *) echo -e "${RED}❌ Invalid choice. Skipping terminal emulator installation.${NC}" ;;
esac

echo -e "${GREEN}✅ AUR packages installed successfully via paru.${NC}"
