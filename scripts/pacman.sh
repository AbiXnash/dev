#!/bin/bash

set -e
set -o pipefail

# 🖍️ Colors
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
NC="\033[0m"

echo -e "${BLUE}🔄 Updating system...${NC}"
sudo pacman -Syu --noconfirm

echo -e "${BLUE}📚 Installing manual pages...${NC}"
sudo pacman -S --needed --noconfirm man-db man-pages

echo -e "${BLUE}🛠️ Installing productivity & dev tools...${NC}"
sudo pacman -S --needed --noconfirm \
  vlc \
  tmux tree stow neovim lsd btop \
  git github-cli docker \

echo -e "${GREEN}✅ pacman packages installed successfully.${NC}"
