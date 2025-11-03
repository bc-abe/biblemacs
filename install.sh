#!/bin/bash

# BibleMacs Quick Installer from GitHub
# This script clones the repository and sets up BibleMacs

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default values
INSTALL_DIR="$HOME/biblemacs"
REPO_URL="https://github.com/yourusername/biblemacs.git"

# ASCII Banner
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

# Print colored messages
print_message() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

# Check prerequisites
check_prerequisites() {
    local missing_deps=()
    
    # Check for git
    if ! command -v git &> /dev/null; then
        missing_deps+=("git")
    fi
    
    # Check for Emacs
    if ! command -v emacs &> /dev/null; then
        missing_deps+=("emacs")
    fi
    
    if [ ${#missing_deps[@]} -gt 0 ]; then
        print_error "Missing required dependencies: ${missing_deps[*]}"
        echo ""
        echo "Please install the missing dependencies:"
        echo ""
        
        # Provide platform-specific instructions
        if [[ "$OSTYPE" == "darwin"* ]]; then
            echo "On macOS (using Homebrew):"
            echo "  brew install ${missing_deps[*]}"
        elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
            if [ -f /etc/debian_version ]; then
                echo "On Debian/Ubuntu:"
                echo "  sudo apt-get update"
                echo "  sudo apt-get install ${missing_deps[*]}"
            elif [ -f /etc/redhat-release ]; then
                echo "On Fedora/RHEL/CentOS:"
                echo "  sudo dnf install ${missing_deps[*]}"
            elif [ -f /etc/arch-release ]; then
                echo "On Arch Linux:"
                echo "  sudo pacman -S ${missing_deps[*]}"
            else
                echo "Please install: ${missing_deps[*]}"
            fi
        elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
            echo "On Windows:"
            echo "  Please download and install from official websites:"
            echo "  - Git: https://git-scm.com/download/win"
            echo "  - Emacs: https://www.gnu.org/software/emacs/download.html"
        else
            echo "Please install: ${missing_deps[*]}"
        fi
        exit 1
    fi
    
    # Check Emacs version
    EMACS_VERSION=$(emacs --version | head -n1 | awk '{print $3}')
    MAJOR_VERSION=$(echo $EMACS_VERSION | cut -d. -f1)
    
    print_message "Found Emacs version: $EMACS_VERSION"
    
    if [ "$MAJOR_VERSION" -lt 27 ]; then
        print_warning "Emacs version 27 or higher is recommended for best experience"
        read -p "Continue anyway? (y/n): " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            exit 1
        fi
    fi
}

# Parse command line arguments
parse_args() {
    while [[ $# -gt 0 ]]; do
        case $1 in
            --dir|-d)
                INSTALL_DIR="$2"
                shift 2
                ;;
            --repo|-r)
                REPO_URL="$2"
                shift 2
                ;;
            --help|-h)
                echo "Usage: $0 [OPTIONS]"
                echo ""
                echo "Options:"
                echo "  -d, --dir PATH     Install directory (default: ~/biblemacs)"
                echo "  -r, --repo URL     Repository URL (default: GitHub biblemacs repo)"
                echo "  -h, --help         Show this help message"
                echo ""
                echo "Examples:"
                echo "  $0                              # Install to ~/biblemacs"
                echo "  $0 --dir /opt/biblemacs        # Install to /opt/biblemacs"
                echo "  $0 --repo git@github.com:user/biblemacs.git  # Use SSH"
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

# Clone repository
clone_repository() {
    if [ -d "$INSTALL_DIR" ]; then
        print_warning "Directory $INSTALL_DIR already exists"
        read -p "Do you want to overwrite it? (y/n): " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            print_message "Backing up existing installation..."
            mv "$INSTALL_DIR" "$INSTALL_DIR.backup.$(date +%Y%m%d_%H%M%S)"
        else
            print_error "Installation cancelled"
            exit 1
        fi
    fi
    
    print_message "Cloning BibleMacs repository..."
    git clone "$REPO_URL" "$INSTALL_DIR"
    
    if [ $? -ne 0 ]; then
        print_error "Failed to clone repository"
        print_error "Please check your internet connection and repository URL"
        exit 1
    fi
    
    print_message "Repository cloned successfully"
}

# Backup existing Emacs configuration
backup_emacs_config() {
    if [ -d "$HOME/.emacs.d" ] || [ -f "$HOME/.emacs" ] || [ -f "$HOME/.emacs.el" ]; then
        print_warning "Existing Emacs configuration found"
        echo "Found:"
        [ -d "$HOME/.emacs.d" ] && echo "  - ~/.emacs.d/"
        [ -f "$HOME/.emacs" ] && echo "  - ~/.emacs"
        [ -f "$HOME/.emacs.el" ] && echo "  - ~/.emacs.el"
        echo ""
        read -p "Do you want to backup your existing configuration? (recommended) (y/n): " -n 1 -r
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

# Setup BibleMacs
setup_biblemacs() {
    print_message "Setting up BibleMacs..."
    
    # Create .emacs.d directory
    mkdir -p "$HOME/.emacs.d"
    
    # Copy early-init.el
    cat > "$HOME/.emacs.d/early-init.el" << 'EOF'
;;; early-init.el --- BibleMacs Early Init -*- lexical-binding: t -*-

;; Disable package.el in favor of straight.el
(setq package-enable-at-startup nil)

;; Disable unnecessary UI elements early
(setq menu-bar-mode nil
      tool-bar-mode nil
      scroll-bar-mode nil)

;; Set GC threshold higher for faster startup
(setq gc-cons-threshold (* 50 1000 1000))

;;; early-init.el ends here
EOF
    
    # Create init.el that loads from biblemacs installation
    cat > "$HOME/.emacs.d/init.el" << EOF
;;; init.el --- BibleMacs Loader -*- lexical-binding: t -*-

;; Set BibleMacs home directory
(setq biblemacs-home "$INSTALL_DIR")

;; Load BibleMacs configuration
(org-babel-load-file (expand-file-name "config/init.org" biblemacs-home))

;;; init.el ends here
EOF
    
    print_message "Emacs configuration created"
}

# Create launcher script
create_launcher() {
    print_message "Creating launcher script..."
    
    # Create bin directory if it doesn't exist
    mkdir -p "$HOME/.local/bin"
    
    # Create launcher script
    cat > "$HOME/.local/bin/biblemacs" << EOF
#!/bin/bash
# BibleMacs Launcher

# Set BibleMacs home directory
export BIBLEMACS_HOME="$INSTALL_DIR"

# Launch Emacs with BibleMacs
emacs --no-splash "\$@"
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
Keywords=Bible;Study;Notes;Emacs;
EOF
        print_message "Desktop entry created"
    fi
    
    # Create macOS app bundle
    if [[ "$OSTYPE" == "darwin"* ]]; then
        if command -v osacompile &> /dev/null; then
            print_message "Creating macOS application..."
            osacompile -o ~/Applications/BibleMacs.app -e "do shell script \"$HOME/.local/bin/biblemacs\""
        fi
    fi
}

# Check PATH
check_path() {
    if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
        print_warning "$HOME/.local/bin is not in your PATH"
        echo ""
        echo "To add it to your PATH, add this line to your shell configuration:"
        echo ""
        
        if [ -f "$HOME/.zshrc" ]; then
            echo "  echo 'export PATH=\"\$HOME/.local/bin:\$PATH\"' >> ~/.zshrc"
        elif [ -f "$HOME/.bashrc" ]; then
            echo "  echo 'export PATH=\"\$HOME/.local/bin:\$PATH\"' >> ~/.bashrc"
        else
            echo "  export PATH=\"\$HOME/.local/bin:\$PATH\""
        fi
        echo ""
    fi
}

# Print final instructions
print_instructions() {
    echo ""
    echo -e "${GREEN}========================================${NC}"
    echo -e "${GREEN}   BibleMacs Installation Complete!    ${NC}"
    echo -e "${GREEN}========================================${NC}"
    echo ""
    echo "Installation location: $INSTALL_DIR"
    echo ""
    echo "To start BibleMacs:"
    echo "  1. Run: biblemacs"
    echo "  2. Or: emacs"
    echo "  3. Or find BibleMacs in your applications menu"
    echo ""
    echo "First-time setup:"
    echo "  • Packages will be automatically installed on first launch"
    echo "  • This may take a few minutes - please be patient"
    echo "  • Check the dashboard for quick access to all features"
    echo ""
    echo "Quick start guide:"
    echo "  • Press C-SPC h t for the tutorial"
    echo "  • Press C-SPC b f to browse Bible books"
    echo "  • Press C-SPC n n to create a new note"
    echo "  • Press C-SPC i s to start an inductive study"
    echo ""
    echo "Bible files:"
    echo "  • Bible .org files are in: $INSTALL_DIR/bible/"
    echo "  • Additional translations can be added there"
    echo ""
    echo "For help and documentation:"
    echo "  • GitHub: $REPO_URL"
    echo "  • Tutorial: Press C-SPC h t in Emacs"
    echo "  • Resources: $INSTALL_DIR/resources/"
    echo ""
}

# Main installation
main() {
    clear
    print_banner
    
    parse_args "$@"
    
    print_message "Starting BibleMacs installation..."
    echo ""
    
    # Run installation steps
    check_prerequisites
    clone_repository
    backup_emacs_config
    setup_biblemacs
    create_launcher
    check_path
    
    print_instructions
    
    echo -e "${GREEN}Happy Bible studying! 📖${NC}"
}

# Run main function
main "$@"
