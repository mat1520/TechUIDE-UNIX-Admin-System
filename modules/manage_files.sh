#!/bin/bash

# File management operations

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TECH_UIDE_ROOT="$PROJECT_ROOT/tech_uide"
CURRENT_USER="${CURRENT_USER:-admin}"

manage_files_menu() {
    while true; do
        echo "=== FILE MANAGEMENT ==="
        echo "1. Read File"
        echo "2. Write to File"
        echo "3. Move/Rename File"
        echo "4. List Directory"
        echo "5. Create New File"
        echo "6. Copy File"
        [ "$CURRENT_USER" = "admin" ] && echo "7. Delete File"
        echo "8. Back to Main Menu"
        [ "$CURRENT_USER" != "admin" ] && echo "(Delete option disabled for employees)"
        echo ""
        read -p "Choose option: " choice
        case $choice in
            1) read_file ;;
            2) write_file ;;
            3) move_file ;;
            4) list_directory ;;
            5) create_file ;;
            6) copy_file ;;
            7) [ "$CURRENT_USER" = "admin" ] && delete_file || echo "Access denied." ;;
            8) return 0 ;;
            *) echo "Invalid choice. Try again." ;;
        esac
        echo ""
        read -p "Press Enter to continue..."
    done
}

read_file() {
    echo "=== READ FILE ==="
    show_sample_files
    read -p "Enter file path: " f
    if [ -f "$TECH_UIDE_ROOT/$f" ]; then
        echo "File contents:"
        echo "----------------------------------------"
        cat "$TECH_UIDE_ROOT/$f"
        echo "----------------------------------------"
    else
        echo "File not found: $f"
    fi
}

write_file() {
    echo "=== WRITE TO FILE ==="
    show_sample_files
    read -p "Enter file path: " f
    read -p "Enter content: " c
    echo "$c" >> "$TECH_UIDE_ROOT/$f"
    echo "Content added to $f"
}

move_file() {
    echo "=== MOVE/RENAME FILE ==="
    show_sample_files
    read -p "Source file: " s
    read -p "Destination: " d
    if [ -f "$TECH_UIDE_ROOT/$s" ]; then
        mv "$TECH_UIDE_ROOT/$s" "$TECH_UIDE_ROOT/$d"
        echo "File moved from $s to $d"
    else
        echo "Source file not found: $s"
    fi
}

list_directory() {
    echo "=== LIST DIRECTORY ==="
    echo "Available directories:"
    find "$TECH_UIDE_ROOT" -type d | sed 's|.*tech_uide/||' | head -10
    echo ""
    read -p "Enter directory path (or press Enter for root): " d
    [ -z "$d" ] && d="."
    if [ -d "$TECH_UIDE_ROOT/$d" ]; then
        echo "Contents of $d:"
        ls -la "$TECH_UIDE_ROOT/$d"
    else
        echo "Directory not found: $d"
    fi
}

create_file() {
    echo "=== CREATE NEW FILE ==="
    read -p "Enter file path: " f
    read -p "Enter content: " c
    echo "$c" > "$TECH_UIDE_ROOT/$f"
    echo "File created: $f"
}

copy_file() {
    echo "=== COPY FILE ==="
    show_sample_files
    read -p "Source file: " s
    read -p "Destination: " d
    if [ -f "$TECH_UIDE_ROOT/$s" ]; then
        cp "$TECH_UIDE_ROOT/$s" "$TECH_UIDE_ROOT/$d"
        echo "File copied from $s to $d"
    else
        echo "Source file not found: $s"
    fi
}

delete_file() {
    echo "=== DELETE FILE ==="
    show_sample_files
    read -p "File to delete: " f
    if [ -f "$TECH_UIDE_ROOT/$f" ]; then
        read -p "Are you sure? (y/N): " confirm
        if [ "$confirm" = "y" ]; then
            rm "$TECH_UIDE_ROOT/$f"
            echo "File deleted: $f"
        else
            echo "Deletion cancelled."
        fi
    else
        echo "File not found: $f"
    fi
}

show_sample_files() {
    echo "Sample files available:"
    find "$TECH_UIDE_ROOT" -type f | sed 's|.*tech_uide/||' | head -5
    echo ""
}

export -f manage_files_menu 