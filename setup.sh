#!/bin/bash

# ================================
# RemoteForge Terminal Banner
# Author: OFFICIAL_cyber_satyam27
# ================================

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
MAGENTA='\033[1;35m'
WHITE='\033[1;37m'
NC='\033[0m'

header() {
    clear

    echo -e "${CYAN}"
cat << "EOF"

██████╗ ███████╗███╗   ███╗ ██████╗ ████████╗███████╗
██╔══██╗██╔════╝████╗ ████║██╔═══██╗╚══██╔══╝██╔════╝
██████╔╝█████╗  ██╔████╔██║██║   ██║   ██║   █████╗
██╔══██╗██╔══╝  ██║╚██╔╝██║██║   ██║   ██║   ██╔══╝
██║  ██║███████╗██║ ╚═╝ ██║╚██████╔╝   ██║   ███████╗
╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝ ╚═════╝    ╚═╝   ╚══════╝

███████╗ ██████╗ ██████╗  ██████╗ ███████╗
██╔════╝██╔═══██╗██╔══██╗██╔════╝ ██╔════╝
█████╗  ██║   ██║██████╔╝██║  ███╗█████╗
██╔══╝  ██║   ██║██╔══██╗██║   ██║██╔══╝
██║     ╚██████╔╝██║  ██║╚██████╔╝███████╗
╚═╝      ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚══════╝

EOF

    echo -e "${MAGENTA}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${GREEN}          ╔════════════════════════════════════════════════════╗
║              ⚡ REMOTEFORGE ⚡                     ║
║           Device Control Toolkit                  ║
╠════════════════════════════════════════════════════╣
║  ⚠️  FOR AUTHORIZED USE ONLY                      ║
║                                                    ║
║  Use this toolkit only on devices you own or      ║
║  have explicit permission to manage.              ║
║                                                    ║
║  The author is not responsible for any misuse,    ║
║  unauthorized access, or damage caused by         ║
║  improper use of this software.                   ║
╚════════════════════════════════════════════════════╝${NC}"
    echo -e "${YELLOW}          Author : OFFICIAL_cyber_satyam27${NC}"
    echo -e "${CYAN}          GitHub : https://github.com/OFFICIALcybersatyam27${NC}"
    echo -e "${RED}          YouTube: https://youtube.com/@official_cyber_satyam27${NC}"
    echo -e "${WHITE}          Version: v1.0${NC}"
    echo -e "${MAGENTA}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
}

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to install dependencies
install_dependencies() {
    echo -e "${YELLOW}[*] [⚡] Initializing RemoteForge Core...
[✓] Loading system modules...
[⚙] Installing required dependencies...
[🔧] Configuring runtime environment...
[📦] Resolving package requirements...
[🚀] Bootstrapping RemoteForge Engine...
[🛰] Establishing device management services...
[🛡] Verifying component integrity...
[✔] Dependencies installed successfully.
[✓] RemoteForge is ready.${NC}"
    if command_exists apt-get; then
        sudo apt-get update -y >/dev/null 2>&1
        sudo apt-get install -y adb android-tools-adb android-tools-fastboot ffmpeg >/dev/null 2>&1
    elif command_exists yum; then
        sudo yum install -y android-tools ffmpeg >/dev/null 2>&1
    elif command_exists brew; then
        brew install android-platform-tools ffmpeg >/dev/null 2>&1
    else
        echo -e "${RED}[!] Unsupported package manager. Please install adb and ffmpeg manually.${NC}"
        exit 1
    fi

    # Install Python dependencies
    echo -e "${YELLOW}[*] Installing Python dependencies...${NC}"
    sudo apt install pip -y
    pip install cryptography keyring tqdm keyrings.alt --break-system-packages >/dev/null 2>&1
    echo -e "${GREEN}[+] Dependencies installed successfully!${NC}"
}

# Function to download forge.py if it doesn't exist
download_forge_py() {
    if [ ! -f "forge.py" ]; then
        echo -e "${YELLOW}[*] forge.py not found. Downloading from external source...${NC}"
        curl -o forge.py "https://github.com/OFFICIALcybersatyam27/REMOTEFORGE/blob/main/forge.py"
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}[+] forge.py downloaded successfully!${NC}"
        else
            echo -e "${RED}[!] Failed to download forge.py. Please check your internet connection or download it manually.${NC}"
            exit 1
        fi
    fi
}

# Function to make forge.py executable
make_executable() {
    echo -e "${YELLOW}[*] Making forge.py executable...${NC}"
    chmod +x forge.py
    echo -e "${GREEN}[+] forge.py is now executable!${NC}"
}

# Function to create a symlink for easy access
create_symlink() {
    echo -e "${YELLOW}[*] Creating symlink for easy access...${NC}"
    sudo cp "$(pwd)/forge.py" /usr/local/bin/ghost
    echo -e "${GREEN}[+] Symlink created! You can now run 'ghost' from anywhere.${NC}"
}

# Main installation function
main() {
    header
    echo -e "${YELLOW}[*] Starting installation of Remoteforge  Framework...${NC}"

    # Download forge.py if it doesn't exist
    download_forge_py

    # Install dependencies
    install_dependencies

    # Make forge.py executable
    make_executable

    # Create symlink
    create_symlink

    echo -e "${GREEN}[+] Installation complete!${NC}"
    echo -e "${BLUE}===========================================${NC}"
    echo -e "${YELLOW}To start RemoteForge Framework, simply type 'forge' in your terminal.
    passwd : Remoteforge${NC}"
    echo
}

# Run the main function
main
