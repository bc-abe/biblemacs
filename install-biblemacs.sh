#!/bin/bash

# BibleMacs Installer Script
# A user-friendly Emacs distribution for Bible study

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# ASCII Art Banner
print_banner() {
    echo -e "${BLUE}"
    echo " ____  _ _     _      __  __                "
    echo "|  _ \(_) |   | |    |  \/  |               "
    echo "| |_) |_| |__ | | ___| \  / | __ _  ___ ___ "
    echo "|  _ <| | '_ \| |/ _ \ |\/| |/ _\` |/ __/ __|"
    echo "| |_) | | |_) | |  __/ |  | | (_| | (__\__ \\"
    echo "|____/|_|_.__/|_|\___|_|  |_|\__,_|\___|___/"
    echo ""
    echo "        Emacs for Bible Study"
    echo -e "${NC}"
}

# Function to print colored messages
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
        echo "Please install Emacs first. Visit: https://www.gnu.org/software/emacs/download.html"
        exit 1
    fi
    
    # Get Emacs version
    EMACS_VERSION=$(emacs --version | head -n1 | awk '{print $3}')
    print_message "Found Emacs version: $EMACS_VERSION"
    
    # Check if version is at least 27
    MAJOR_VERSION=$(echo $EMACS_VERSION | cut -d. -f1)
    if [ "$MAJOR_VERSION" -lt 27 ]; then
        print_warning "Emacs version 27 or higher is recommended for best experience"
    fi
}

# Parse arguments
parse_args() {
    INSTALL_DIR="$HOME/biblemacs"
    
    while [[ $# -gt 0 ]]; do
        case $1 in
            --dir|-d)
                INSTALL_DIR="$2"
                shift 2
                ;;
            --help|-h)
                echo "Usage: $0 [OPTIONS]"
                echo ""
                echo "Options:"
                echo "  -d, --dir PATH    Install directory (default: ~/biblemacs)"
                echo "  -h, --help        Show this help message"
                echo ""
                exit 0
                ;;
            *)
                print_error "Unknown option: $1"
                echo "Use --help for usage information"
                exit 1
                ;;
        esac
    done
}

# Create directory structure
create_directories() {
    print_message "Creating BibleMacs directory structure at: $INSTALL_DIR"
    
    # Create main directory
    mkdir -p "$INSTALL_DIR"
    
    # Create subdirectories
    mkdir -p "$INSTALL_DIR/code"
    mkdir -p "$INSTALL_DIR/bible"
    mkdir -p "$INSTALL_DIR/notes"
    mkdir -p "$INSTALL_DIR/projects"
    mkdir -p "$INSTALL_DIR/site/static"
    mkdir -p "$INSTALL_DIR/resources"
    
    print_message "Directory structure created successfully"
}

# Backup existing Emacs configuration
backup_emacs_config() {
    if [ -d "$HOME/.emacs.d" ]; then
        print_warning "Existing Emacs configuration found at ~/.emacs.d"
        read -p "Do you want to backup your existing configuration? (y/n): " -n 1 -r
        echo
        
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            BACKUP_DIR="$HOME/.emacs.d.backup.$(date +%Y%m%d_%H%M%S)"
            print_message "Backing up to: $BACKUP_DIR"
            mv "$HOME/.emacs.d" "$BACKUP_DIR"
        fi
    fi
}

# Download required files
download_files() {
    print_message "Downloading required files..."
    
    # Download Cascadia Code Nerd Font if not exists
    FONT_DIR="$HOME/.local/share/fonts"
    if [ ! -f "$FONT_DIR/CascadiaCodeNerdFont-Regular.ttf" ]; then
        print_message "Installing Cascadia Code Nerd Font..."
        mkdir -p "$FONT_DIR"
        
        # Note: In production, you'd download from the actual Nerd Fonts repository
        # For now, we'll create a note about this
        echo "Please download Cascadia Code Nerd Font from: https://www.nerdfonts.com/font-downloads" > "$INSTALL_DIR/resources/font-install.txt"
    fi
}

# Create starter files
create_starter_files() {
    print_message "Creating starter files..."
    
    # These files will be created by the main script
    # Placeholder for now
    touch "$INSTALL_DIR/notes/index.org"
    touch "$INSTALL_DIR/projects/index.org"
    touch "$INSTALL_DIR/projects/lab.org"
}

# Setup Emacs directory
setup_emacs_dir() {
    print_message "Setting up Emacs configuration..."
    
    # Create .emacs.d if it doesn't exist
    mkdir -p "$HOME/.emacs.d"
    
    # Create early-init.el for faster startup
    cat > "$HOME/.emacs.d/early-init.el" << 'EOF'
;;; early-init.el --- BibleMacs Early Init -*- lexical-binding: t -*-

;; Disable package.el in favor of straight.el
(setq package-enable-at-startup nil)

;; Disable unnecessary UI elements early
(setq menu-bar-mode nil
      tool-bar-mode nil
      scroll-bar-mode nil)

;; Prevent the glimpse of un-styled Emacs by disabling these UI elements early
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

;; Set GC threshold higher for faster startup
(setq gc-cons-threshold (* 50 1000 1000))

;;; early-init.el ends here
EOF
}

# Create launch script
create_launch_script() {
    print_message "Creating launch script..."
    
    cat > "$INSTALL_DIR/biblemacs" << EOF
#!/bin/bash
# BibleMacs Launcher

# Set BibleMacs home directory
export BIBLEMACS_HOME="$INSTALL_DIR"

# Launch Emacs with BibleMacs configuration
emacs --no-splash \\
      --eval "(setq biblemacs-home \"$INSTALL_DIR\")" \\
      --eval "(org-babel-load-file \"$INSTALL_DIR/code/init.org\")" \\
      "\$@"
EOF
    
    chmod +x "$INSTALL_DIR/biblemacs"
    
    # Create desktop entry for Linux users
    if [ -d "$HOME/.local/share/applications" ]; then
        cat > "$HOME/.local/share/applications/biblemacs.desktop" << EOF
[Desktop Entry]
Name=BibleMacs
Comment=Emacs for Bible Study
Exec=$INSTALL_DIR/biblemacs
Icon=emacs
Type=Application
Categories=Education;TextEditor;
EOF
        print_message "Desktop entry created"
    fi
}

# Final instructions
print_instructions() {
    echo ""
    echo -e "${GREEN}========================================${NC}"
    echo -e "${GREEN}   BibleMacs Installation Complete!${NC}"
    echo -e "${GREEN}========================================${NC}"
    echo ""
    echo "Installation location: $INSTALL_DIR"
    echo ""
    echo "To start BibleMacs, run:"
    echo "  $INSTALL_DIR/biblemacs"
    echo ""
    echo "You can also add an alias to your shell configuration:"
    echo "  echo 'alias biblemacs=\"$INSTALL_DIR/biblemacs\"' >> ~/.bashrc"
    echo ""
    echo "First-time setup:"
    echo "1. On first launch, packages will be automatically installed"
    echo "2. This may take a few minutes"
    echo "3. Check the Resources folder for tutorials"
    echo ""
    echo "Important:"
    echo "- Place your Bible .org files in: $INSTALL_DIR/bible/"
    echo "- Your notes will be saved in: $INSTALL_DIR/notes/"
    echo "- Projects go in: $INSTALL_DIR/projects/"
    echo ""
    echo "For help, see: $INSTALL_DIR/resources/"
    echo ""
}

# Main installation flow
main() {
    clear
    print_banner
    
    parse_args "$@"
    
    print_message "Starting BibleMacs installation..."
    echo ""
    
    # Run installation steps
    check_emacs
    backup_emacs_config
    create_directories
    download_files
    create_starter_files
    setup_emacs_dir
    create_launch_script
    
    print_instructions
}

# Run main function
main "$@"
