#!/bin/bash

# Permissions and links management

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TECH_UIDE_ROOT="$PROJECT_ROOT/tech_uide"
CURRENT_USER="${CURRENT_USER:-admin}"

permissions_links_menu() {
    [ "$CURRENT_USER" != "admin" ] && echo "Access denied. Admin only." && return 1
    while true; do
        echo "=== PERMISSIONS & LINKS ==="
        echo "1. View Permissions"
        echo "2. Set File Permissions"
        echo "3. Set Directory Permissions"
        echo "4. Create Symbolic Link"
        echo "5. Create Hard Link"
        echo "6. View Links"
        echo "7. Back to Main Menu"
        echo ""
        read -p "Choose option: " choice
        case $choice in
            1) view_permissions ;;
            2) set_file_permissions ;;
            3) set_directory_permissions ;;
            4) create_symlink ;;
            5) create_hardlink ;;
            6) view_links ;;
            7) return 0 ;;
            *) echo "Invalid choice. Try again." ;;
        esac
        echo ""
        read -p "Press Enter to continue..."
    done
}

view_permissions() {
    echo "=== VIEW PERMISSIONS ==="
    echo "Directory permissions:"
    ls -ld "$TECH_UIDE_ROOT"
    ls -ld "$TECH_UIDE_ROOT"/*/ 2>/dev/null | head -5
    echo ""
    echo "File permissions (sample):"
    find "$TECH_UIDE_ROOT" -type f | head -5 | while read file; do
        ls -l "$file"
    done
}

set_file_permissions() {
    echo "=== SET FILE PERMISSIONS ==="
    show_sample_files
    read -p "Enter file path: " f
    if [ ! -f "$TECH_UIDE_ROOT/$f" ]; then
        echo "File not found: $f"
        return 1
    fi
    echo "Current permissions:"
    ls -l "$TECH_UIDE_ROOT/$f"
    echo ""
    echo "Permission options:"
    echo "1. Read only (444)"
    echo "2. Read/Write (644)"
    echo "3. Read/Write/Execute (755)"
    echo "4. Custom permissions"
    read -p "Choose option: " opt
    case $opt in
        1) chmod 444 "$TECH_UIDE_ROOT/$f" ;;
        2) chmod 644 "$TECH_UIDE_ROOT/$f" ;;
        3) chmod 755 "$TECH_UIDE_ROOT/$f" ;;
        4) read -p "Enter custom permissions (e.g., 600): " p; chmod "$p" "$TECH_UIDE_ROOT/$f" ;;
        *) echo "Invalid choice." ;;
    esac
    echo "New permissions:"
    ls -l "$TECH_UIDE_ROOT/$f"
}

set_directory_permissions() {
    echo "=== SET DIRECTORY PERMISSIONS ==="
    echo "Available directories:"
    find "$TECH_UIDE_ROOT" -type d | sed 's|.*tech_uide/||' | head -10
    echo ""
    read -p "Enter directory path: " d
    if [ ! -d "$TECH_UIDE_ROOT/$d" ]; then
        echo "Directory not found: $d"
        return 1
    fi
    echo "Current permissions:"
    ls -ld "$TECH_UIDE_ROOT/$d"
    echo ""
    echo "Permission options:"
    echo "1. Read only (555)"
    echo "2. Read/Write (755)"
    echo "3. Full access (777)"
    echo "4. Custom permissions"
    read -p "Choose option: " opt
    case $opt in
        1) chmod 555 "$TECH_UIDE_ROOT/$d" ;;
        2) chmod 755 "$TECH_UIDE_ROOT/$d" ;;
        3) chmod 777 "$TECH_UIDE_ROOT/$d" ;;
        4) read -p "Enter custom permissions (e.g., 750): " p; chmod "$p" "$TECH_UIDE_ROOT/$d" ;;
        *) echo "Invalid choice." ;;
    esac
    echo "New permissions:"
    ls -ld "$TECH_UIDE_ROOT/$d"
}

create_symlink() {
    echo "=== CREATE SYMBOLIC LINK ==="
    show_sample_files
    read -p "Enter source file: " s
    if [ ! -f "$TECH_UIDE_ROOT/$s" ]; then
        echo "Source file not found: $s"
        return 1
    fi
    read -p "Enter link name: " l
    ln -s "$TECH_UIDE_ROOT/$s" "$TECH_UIDE_ROOT/$l"
    echo "Symbolic link created: $l -> $s"
    ls -la "$TECH_UIDE_ROOT/$l"
}

create_hardlink() {
    echo "=== CREATE HARD LINK ==="
    show_sample_files
    read -p "Enter source file: " s
    if [ ! -f "$TECH_UIDE_ROOT/$s" ]; then
        echo "Source file not found: $s"
        return 1
    fi
    read -p "Enter link name: " l
    ln "$TECH_UIDE_ROOT/$s" "$TECH_UIDE_ROOT/$l"
    echo "Hard link created: $l -> $s"
    ls -la "$TECH_UIDE_ROOT/$l"
    echo "Inode information:"
    ls -i "$TECH_UIDE_ROOT/$s" "$TECH_UIDE_ROOT/$l"
}

view_links() {
    echo "=== VIEW LINKS ==="
    echo "Symbolic links:"
    find "$TECH_UIDE_ROOT" -type l 2>/dev/null | while read link; do
        echo "$(basename "$link") -> $(readlink "$link")"
    done
    echo ""
    echo "Files with multiple hard links:"
    find "$TECH_UIDE_ROOT" -type f -links +1 2>/dev/null | while read file; do
        local link_count=$(stat -c %h "$file" 2>/dev/null || stat -f %l "$file" 2>/dev/null)
        echo "$(basename "$file") ($link_count links)"
    done
}

show_sample_files() {
    echo "Sample files available:"
    find "$TECH_UIDE_ROOT" -type f | sed 's|.*tech_uide/||' | head -5
    echo ""
}

export -f permissions_links_menu 