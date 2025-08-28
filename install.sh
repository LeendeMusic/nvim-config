#!/bin/bash

# Neovim Configuration Installer
# This script installs the personal Neovim configuration

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🚀 Installing Neovim Configuration...${NC}"

# Check if Neovim is installed
if ! command -v nvim &> /dev/null; then
    echo -e "${RED}❌ Neovim is not installed. Please install Neovim first.${NC}"
    echo -e "${YELLOW}Visit: https://neovim.io/download/${NC}"
    exit 1
fi

# Check Neovim version
nvim_version=$(nvim --version | head -n1 | cut -d' ' -f2 | cut -c2-)
required_version="0.7.0"

version_compare() {
    printf '%s\n%s\n' "$1" "$2" | sort -V -C
}

if ! version_compare "$required_version" "$nvim_version"; then
    echo -e "${RED}❌ Neovim version $nvim_version is too old. Required: $required_version or newer${NC}"
    exit 1
fi

echo -e "${GREEN}✅ Neovim version $nvim_version detected${NC}"

# Backup existing configuration
if [ -d "$HOME/.config/nvim" ]; then
    echo -e "${YELLOW}⚠️  Backing up existing Neovim configuration...${NC}"
    mv "$HOME/.config/nvim" "$HOME/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)"
    echo -e "${GREEN}✅ Backup created${NC}"
fi

# Create config directory
mkdir -p "$HOME/.config"

# Clone the configuration
echo -e "${BLUE}📥 Cloning configuration repository...${NC}"
git clone https://github.com/LeendeMusic/nvim-config.git "$HOME/.config/nvim"

# Install Packer if not already installed
PACKER_DIR="$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"
if [ ! -d "$PACKER_DIR" ]; then
    echo -e "${BLUE}📦 Installing Packer plugin manager...${NC}"
    git clone --depth 1 https://github.com/wbthomason/packer.nvim "$PACKER_DIR"
    echo -e "${GREEN}✅ Packer installed${NC}"
else
    echo -e "${GREEN}✅ Packer already installed${NC}"
fi

# Install plugins
echo -e "${BLUE}🔌 Installing Neovim plugins...${NC}"
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

echo -e "${GREEN}🎉 Installation completed successfully!${NC}"
echo -e "${YELLOW}💡 Restart Neovim to see the new configuration in action.${NC}"
echo -e "${BLUE}📖 For more information, check the README at ~/.config/nvim/README.md${NC}"