#!/bin/bash

set -e
set -o pipefail

# 🎨 Colors
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
NC="\033[0m"

echo -e "${BLUE}🌐 Setting up Programming Languages...${NC}"

# Python
read -p "$(echo -e ${YELLOW}"Do you want to install Python and tools (pip, pyenv, luarocks, lua51)? (y/n): "${NC})" install_python
if [[ "$install_python" =~ ^[Yy]$ ]]; then
  echo -e "${GREEN}Installing Python, pip, pyenv, luarocks, lua51...${NC}"
  sudo pacman -S --needed --noconfirm python-pip pyenv luarocks lua51
  echo -e "${GREEN}✔ Python environment installed.${NC}"
fi

# Node.js
read -p "$(echo -e ${YELLOW}"Do you want to install Node.js and npm? (y/n): "${NC})" install_node
if [[ "$install_node" =~ ^[Yy]$ ]]; then
  echo -e "${GREEN}Installing Node.js and npm...${NC}"
  sudo pacman -S --needed --noconfirm nodejs npm
  echo -e "${GREEN}✔ Node.js environment installed.${NC}"
fi

# Java
read -p "$(echo -e ${YELLOW}"Do you want to install Java (JDK21, Maven, docs)? (y/n): "${NC})" install_java
if [[ "$install_java" =~ ^[Yy]$ ]]; then
  sudo pacman -S --needed --noconfirm openjdk21-doc openjdk21-src maven jdk21-openjdk
  echo -e "${GREEN}✔ Java environment installed.${NC}"
fi

# Rust
read -p "$(echo -e ${YELLOW}"Do you want to install Rust via rustup? (y/n): "${NC})" install_rust
if [[ "$install_rust" =~ ^[Yy]$ ]]; then
  paru -S --needed --noconfirm rustup
  echo -e "${GREEN}✔ Rust installed via rustup.${NC}"
fi

# Go (Golang)
read -p "$(echo -e ${YELLOW}"Do you want to install Go (Golang)? (y/n): "${NC})" install_go
if [[ "$install_go" =~ ^[Yy]$ ]]; then
  paru -S --needed --noconfirm go
  echo -e "${GREEN}✔ Golang installed.${NC}"
fi

echo -e "${BLUE}✅ Language setup completed.${NC}"

