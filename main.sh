#!/bin/bash

# Tech UIDE E-commerce System

CYAN='\033[0;36m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' 

CURRENT_USER=""
PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MODULES_DIR="$PROJECT_ROOT/modules"

authenticate() {
    echo -e "${CYAN}=== Tech UIDE E-commerce System ===${NC}"
    read -p "Enter username: " u
    case $u in 
        "admin"|"maria"|"pedro") 
            CURRENT_USER=$u
            echo -e "${GREEN}Welcome, $CURRENT_USER!${NC}"
            return 0
        ;; 
        *) 
            echo -e "${RED}Invalid user. Try again.${NC}"
            return 1
        ;;
    esac
}

show_menu() {
    clear
    echo -e "${CYAN}=== ${CURRENT_USER^^} MENU ===${NC}"
    echo -e "${YELLOW}1. View Project Structure${NC}"
    echo -e "${YELLOW}2. File Management${NC}"
    echo -e "${YELLOW}3. Compression & Search${NC}"
    [ "$CURRENT_USER" = "admin" ] && echo -e "${YELLOW}4. Create/Reset Structure${NC}"
    [ "$CURRENT_USER" = "admin" ] && echo -e "${YELLOW}5. Permissions & Links${NC}"
    echo -e "${YELLOW}6. Exit${NC}"
}

run_menu() {
    while true; do
        show_menu
        read -p "$(echo -e "${YELLOW}Choose option: ${NC}")" choice
        case $choice in
            1) source "$MODULES_DIR/project_architecture.sh"; display_architecture ;;
            2) source "$MODULES_DIR/manage_files.sh"; manage_files_menu ;;
            3) source "$MODULES_DIR/compression_patterns.sh"; compression_patterns_menu ;;
            4) [ "$CURRENT_USER" = "admin" ] && source "$MODULES_DIR/create_files_dirs.sh" && create_file_structure || echo -e "${RED}Access denied.${NC}" ;;
            5) [ "$CURRENT_USER" = "admin" ] && source "$MODULES_DIR/permissions_links.sh" && permissions_links_menu || echo -e "${RED}Access denied.${NC}" ;;
            6) echo -e "${GREEN}Goodbye!${NC}"; exit 0 ;;
            *) echo -e "${RED}Invalid choice. Try again.${NC}" ;;
        esac
        read -p "Press Enter to continue..."
    done
}

[ ! -d "$MODULES_DIR" ] && echo -e "${RED}Error: Modules directory not found!${NC}" && exit 1
while ! authenticate; do :; done
run_menu 