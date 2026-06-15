#!/bin/bash
# SHAKTI GODMODE - One Click Installer for Termux

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${CYAN}"
echo "╔══════════════════════════════════════════════════╗"
echo "║  🔥 SHAKTI GODMODE INSTALLER FOR TERMUX 🔥     ║"
echo "╚══════════════════════════════════════════════════╝"
echo -e "${NC}"

# Check if running in Termux
if [[ ! -d "/data/data/com.termux" ]]; then
    echo -e "${RED}⚠️ This script is for Termux only!${NC}"
    exit 1
fi

# Update packages
echo -e "${GREEN}[+] Updating Termux packages...${NC}"
pkg update -y && pkg upgrade -y

# Install Python if not installed
if ! command -v python3 &> /dev/null; then
    echo -e "${GREEN}[+] Installing Python...${NC}"
    pkg install python -y
fi

# Download SHAKTI
echo -e "${GREEN}[+] Downloading SHAKTI Godmode...${NC}"
curl -s -o ~/shakti.py https://raw.githubusercontent.com/YOUR_USERNAME/shakti-godmode/main/shakti.py

# Make executable
chmod +x ~/shakti.py

# Create alias
if ! grep -q "alias shakti=" ~/.bashrc 2>/dev/null; then
    echo "alias shakti='python3 ~/shakti.py'" >> ~/.bashrc
fi

# Create termux shortcut
mkdir -p ~/.termux
echo "shakti" > ~/.termux/start.sh

echo -e "${GREEN}"
echo "✅ INSTALLATION COMPLETE!"
echo -e "${NC}"
echo -e "${CYAN}🔥 TO RUN SHAKTI:${NC}"
echo "   Type: shakti"
echo "   OR: python3 ~/shakti.py"
echo ""
echo -e "${CYAN}📝 TIPS:${NC}"
echo "   • Restart Termux or run 'source ~/.bashrc' to use 'shakti' command"
echo "   • Type 'help' inside SHAKTI for commands"
echo "   • Type 'exit' to quit"
echo ""

# Ask to run now
read -p "Run SHAKTI now? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    python3 ~/shakti.py
fi
