#!/bin/bash

# BibleMacs Setup Script
# Run this after cloning the repository to set up BibleMacs

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BIBLEMACS_HOME="$SCRIPT_DIR"

echo -e "${BLUE}"
echo " ____  _ _     _      __  __                "
echo "|  _ \(_) |   | |    |  \/  |               "
echo "| |_) |_| |__ | | ___| \  / | __ _  ___ ___ "
echo "|  _ <| | '_ \| |/ _ \ |\/| |/ _\` |/ __/ __|"
echo "| |_) | | |_) | |  __/ |  | | (_| | (__\__ \\"
echo "|____/|_|_.__/|_|\___|_|  |_|\__,_|\___|___/"
echo ""
echo "        Setup Script"
echo -e "${NC}"

print_message() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

# Check if Emacs is installed
check_emacs() {
    if ! command -v emacs &> /dev/null; then
        print_error "Emacs is not installed!"
        echo "Please install Emacs version 27 or higher."
        echo "Visit: https://www.gnu.org/software/emacs/download.html"
        exit 1
    fi
    
    EMACS_VERSION=$(emacs --version | head -n1 | awk '{print $3}')
    print_message "Found Emacs version: $EMACS_VERSION"
}

# Create directory structure
create_directories() {
    print_message "Creating directory structure..."
    
    # Create user directories if they don't exist
    mkdir -p "$BIBLEMACS_HOME/notes"
    mkdir -p "$BIBLEMACS_HOME/projects"
    mkdir -p "$BIBLEMACS_HOME/site/static"
    
    # Create index files if they don't exist
    if [ ! -f "$BIBLEMACS_HOME/notes/index.org" ]; then
        cat > "$BIBLEMACS_HOME/notes/index.org" << 'EOF'
#+TITLE: Notes Index
#+DATE: 

* Notes

Your notes will appear here automatically.
EOF
    fi
    
    if [ ! -f "$BIBLEMACS_HOME/projects/index.org" ]; then
        cat > "$BIBLEMACS_HOME/projects/index.org" << 'EOF'
#+TITLE: Projects Index
#+DATE: 

* Projects

Your projects will appear here automatically.
EOF
    fi
    
    if [ ! -f "$BIBLEMACS_HOME/projects/lab.org" ]; then
        cat > "$BIBLEMACS_HOME/projects/lab.org" << 'EOF'
#+TITLE: Inductive Study Lab
#+DATE: 

* Inductive Studies

Your inductive Bible studies will be added here.
EOF
    fi
}

# Backup existing Emacs configuration
backup_emacs_config() {
    if [ -d "$HOME/.emacs.d" ] || [ -f "$HOME/.emacs" ] || [ -f "$HOME/.emacs.el" ]; then
        print_warning "Existing Emacs configuration found"
        read -p "Do you want to backup your existing configuration? (y/n): " -n 1 -r
        echo
        
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            BACKUP_DIR="$HOME/.emacs.backup.$(date +%Y%m%d_%H%M%S)"
            mkdir -p "$BACKUP_DIR"
            
            [ -d "$HOME/.emacs.d" ] && mv "$HOME/.emacs.d" "$BACKUP_DIR/"
            [ -f "$HOME/.emacs" ] && mv "$HOME/.emacs" "$BACKUP_DIR/"
            [ -f "$HOME/.emacs.el" ] && mv "$HOME/.emacs.el" "$BACKUP_DIR/"
            
            print_message "Backup created at: $BACKUP_DIR"
        fi
    fi
}

# Setup Emacs configuration
setup_emacs_config() {
    print_message "Setting up Emacs configuration..."
    
    # Create .emacs.d directory
    mkdir -p "$HOME/.emacs.d"
    
    # Create early-init.el
    cat > "$HOME/.emacs.d/early-init.el" << 'EOF'
;;; early-init.el --- BibleMacs Early Init -*- lexical-binding: t -*-

;; Disable package.el in favor of straight.el
(setq package-enable-at-startup nil)

;; Disable UI elements early for faster startup
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

;; Set GC threshold higher for faster startup
(setq gc-cons-threshold (* 50 1000 1000))

;;; early-init.el ends here
EOF
    
    # Create init.el that loads BibleMacs configuration
    cat > "$HOME/.emacs.d/init.el" << EOF
;;; init.el --- BibleMacs Initialization -*- lexical-binding: t -*-

;; Set BibleMacs home directory
(setq biblemacs-home "$BIBLEMACS_HOME")

;; Load BibleMacs configuration
(condition-case err
    (org-babel-load-file (expand-file-name "config/init.org" biblemacs-home))
  (error (message "Error loading BibleMacs: %s" err)))

;;; init.el ends here
EOF
}

# Create launcher script
create_launcher() {
    print_message "Creating launcher script..."
    
    mkdir -p "$HOME/.local/bin"
    
    cat > "$HOME/.local/bin/biblemacs" << EOF
#!/bin/bash
# BibleMacs Launcher

export BIBLEMACS_HOME="$BIBLEMACS_HOME"
exec emacs "\$@"
EOF
    
    chmod +x "$HOME/.local/bin/biblemacs"
    
    # Create desktop entry for Linux
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        mkdir -p "$HOME/.local/share/applications"
        cat > "$HOME/.local/share/applications/biblemacs.desktop" << EOF
[Desktop Entry]
Name=BibleMacs
Comment=Emacs for Bible Study
Exec=$HOME/.local/bin/biblemacs
Icon=emacs
Type=Application
Categories=Education;TextEditor;
Keywords=Bible;Study;Notes;
StartupNotify=true
StartupWMClass=Emacs
EOF
        print_message "Desktop entry created"
    fi
}

# Check for Bible files
check_bible_files() {
    local bible_count=$(find "$BIBLEMACS_HOME/bible" -name "*.org" -type f 2>/dev/null | wc -l)
    
    if [ "$bible_count" -eq 0 ]; then
        print_warning "No Bible files found in $BIBLEMACS_HOME/bible/"
        echo ""
        echo "To add Bible files:"
        echo "1. Download Bible text in plain text format"
        echo "2. Convert to .org format (see bible/README.md)"
        echo "3. Place files in: $BIBLEMACS_HOME/bible/"
        echo ""
    else
        print_message "Found $bible_count Bible book files"
    fi
}

# Install fonts
install_fonts() {
    print_message "Checking fonts..."
    
    if ! fc-list | grep -q "CascadiaCode.*Nerd"; then
        print_warning "Cascadia Code Nerd Font not found"
        echo "For the best experience, install Cascadia Code Nerd Font:"
        echo "  https://www.nerdfonts.com/font-downloads"
        echo ""
        read -p "Would you like to download it now? (y/n): " -n 1 -r
        echo
        
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            if [[ "$OSTYPE" == "darwin"* ]]; then
                echo "On macOS, you can install with Homebrew:"
                echo "  brew tap homebrew/cask-fonts"
                echo "  brew install --cask font-cascadia-code-nerd-font"
            elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
                mkdir -p "$HOME/.local/share/fonts"
                cd /tmp
                wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaCode.zip
                unzip CascadiaCode.zip -d CascadiaCode
                mv CascadiaCode/*.ttf "$HOME/.local/share/fonts/"
                fc-cache -f
                print_message "Font installed"
            fi
        fi
    else
        print_message "Cascadia Code Nerd Font found"
    fi
}

# Main setup
main() {
    print_message "Starting BibleMacs setup..."
    echo ""
    
    check_emacs
    create_directories
    backup_emacs_config
    setup_emacs_config
    create_launcher
    install_fonts
    check_bible_files
    
    # Add to PATH if needed
    if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
        print_warning "Adding $HOME/.local/bin to PATH"
        
        if [ -f "$HOME/.bashrc" ]; then
            echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"
        fi
        
        if [ -f "$HOME/.zshrc" ]; then
            echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.zshrc"
        fi
        
        export PATH="$HOME/.local/bin:$PATH"
    fi
    
    echo ""
    echo -e "${GREEN}========================================${NC}"
    echo -e "${GREEN}     BibleMacs Setup Complete!         ${NC}"
    echo -e "${GREEN}========================================${NC}"
    echo ""
    echo "BibleMacs is installed at: $BIBLEMACS_HOME"
    echo ""
    echo "To start BibleMacs:"
    echo "  1. Run: biblemacs"
    echo "  2. Or: emacs"
    echo ""
    echo "First launch will download and install packages."
    echo "This may take 3-5 minutes - please be patient!"
    echo ""
    echo "Quick commands to remember:"
    echo "  C-SPC h t : Open tutorial"
    echo "  C-SPC b f : Find Bible book"
    echo "  C-SPC n n : New note"
    echo ""
    echo "Happy studying! 📖"
}

# Run main
main "$@"
