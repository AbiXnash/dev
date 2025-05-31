#!/bin/bash

set -e
set -o pipefail

# 🎨 Colors
GREEN="\033[1;32m"
RED="\033[1;31m"
BLUE="\033[1;34m"
YELLOW="\033[1;33m"
NC="\033[0m"

# 📌 Script Directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPTS="$SCRIPT_DIR/scripts"

# 🎯 Ensure Executable Permissions
echo -e "${YELLOW}🔧 Setting executable permissions for all scripts...${NC}"
chmod +x "$SCRIPTS"/*.sh

# 1️⃣ Check for Arch Linux
if [[ ! -f /etc/arch-release ]]; then
    echo -e "${RED}❌ This system is not Arch-based. Exiting.${NC}"
    exit 1
fi
echo -e "${GREEN}✅ Arch Linux detected.${NC}"

# 2️⃣ Run pacman.sh
echo -e "${BLUE}📦 Installing packages from pacman.sh...${NC}"
"$SCRIPTS/pacman.sh"

# 3️⃣ Ensure paru is available
if ! command -v paru &> /dev/null; then
    echo -e "${YELLOW}🔍 paru not found. Installing paru...${NC}"
    sudo pacman -S --needed --noconfirm base-devel git
    git clone https://aur.archlinux.org/paru.git /tmp/paru
    pushd /tmp/paru > /dev/null
    makepkg -si --noconfirm
    popd > /dev/null
    echo -e "${GREEN}✅ paru installed.${NC}"
else
    echo -e "${GREEN}✅ paru already installed.${NC}"
fi

# 4️⃣ Run paru.sh
echo -e "${BLUE}📦 Installing packages from paru.sh...${NC}"
"$SCRIPTS/paru.sh"

# 5️⃣ Run lang.sh
echo -e "${BLUE}📦 Setting up languages from lang.sh...${NC}"
"$SCRIPTS/lang.sh"

# 🎉 All Done!
clear
echo -e "${GREEN}🎉 Development environment setup is complete!${NC}"

# 🙏 Credits
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "✨ Script crafted with ❤️ by Abinash (ABX)"
echo -e "🔗 GitHub: https://github.com/AbiXnash"
echo -e "🏢 Java Developer @ Mindgate (2025)"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

