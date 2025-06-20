#!/bin/bash

# Compression and search operations

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TECH_UIDE_ROOT="$PROJECT_ROOT/tech_uide"

compression_patterns_menu() {
    while true; do
        echo "=== COMPRESSION & SEARCH ==="
        echo "1. Create TAR Archive"
        echo "2. Create GZIP Archive"
        echo "3. Create ZIP Archive"
        echo "4. Extract Archive"
        echo "5. Search by Pattern"
        echo "6. Search by Content"
        echo "7. Back to Main Menu"
        echo ""
        read -p "Choose option: " choice
        case $choice in
            1) create_archive "tar" ;;
            2) create_archive "gz" ;;
            3) create_archive "zip" ;;
            4) extract_archive ;;
            5) search_by_pattern ;;
            6) search_by_content ;;
            7) return 0 ;;
            *) echo "Invalid choice. Try again." ;;
        esac
        echo ""
        read -p "Press Enter to continue..."
    done
}

create_archive() {
    echo "=== CREATE $1 ARCHIVE ==="
    echo "Available directories:"
    find "$TECH_UIDE_ROOT" -type d -maxdepth 2 | sed 's|.*tech_uide/||' | head -10
    echo ""
    read -p "Enter directory to compress: " d
    local src="$TECH_UIDE_ROOT/$d"
    if [ ! -d "$src" ]; then
        echo "Directory not found: $d"
        return 1
    fi
    local fname="$(basename "$d")_$(date +%Y%m%d_%H%M%S)"
    case $1 in
        tar) tar -cf "$fname.tar" -C "$TECH_UIDE_ROOT" "$d" ;;
        gz) tar -czf "$fname.tar.gz" -C "$TECH_UIDE_ROOT" "$d" ;;
        zip) cd "$TECH_UIDE_ROOT" && zip -r "$fname.zip" "$d" ;;
    esac
    echo "Archive created: $fname.$1"
}

extract_archive() {
    echo "=== EXTRACT ARCHIVE ==="
    echo "Available archives in current directory:"
    ls -la *.tar *.tar.gz *.zip 2>/dev/null | head -5
    echo ""
    read -p "Enter archive name: " a
    if [ ! -f "$a" ]; then
        echo "Archive not found: $a"
        return 1
    fi
    read -p "Enter destination directory: " d
    mkdir -p "$TECH_UIDE_ROOT/$d"
    case $a in
        *.tar) tar -xf "$a" -C "$TECH_UIDE_ROOT/$d" ;;
        *.tar.gz|*.tgz) tar -xzf "$a" -C "$TECH_UIDE_ROOT/$d" ;;
        *.zip) unzip "$a" -d "$TECH_UIDE_ROOT/$d" ;;
        *) echo "Unsupported archive format" ;;
    esac
    echo "Archive extracted to $d"
}

search_by_pattern() {
    echo "=== SEARCH BY PATTERN ==="
    echo "1. Search by filename pattern"
    echo "2. Search by file extension"
    read -p "Choose option: " opt
    case $opt in
        1) read -p "Enter filename pattern: " p; find "$TECH_UIDE_ROOT" -name "*$p*" ;;
        2) read -p "Enter file extension (e.g., txt): " ext; find "$TECH_UIDE_ROOT" -name "*.$ext" ;;
        *) echo "Invalid choice." ;;
    esac
}

search_by_content() {
    echo "=== SEARCH BY CONTENT ==="
    read -p "Enter text to search: " text
    echo "Files containing '$text':"
    grep -r -l "$text" "$TECH_UIDE_ROOT"
}

export -f compression_patterns_menu 