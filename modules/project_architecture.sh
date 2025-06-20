#!/bin/bash

# Show project structure

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TECH_UIDE_ROOT="$PROJECT_ROOT/tech_uide"

display_architecture() {
    echo "=== PROJECT ARCHITECTURE ==="
    [ ! -d "$TECH_UIDE_ROOT" ] && echo "Directory not found! Create structure first (option 4)." && return 1
    
    echo "Root directory: $(realpath "$TECH_UIDE_ROOT")"
    echo "Current working directory: $(pwd)"
    echo ""
    
    echo "=== DIRECTORY TREE ==="
    if command -v tree >/dev/null 2>&1; then
        tree "$TECH_UIDE_ROOT" -I "*.log"
    else
        find "$TECH_UIDE_ROOT" -type d | sed 's|[^/]*/|  |g'
    fi
    echo ""
    
    echo "=== STATISTICS ==="
    local dir_count=$(find "$TECH_UIDE_ROOT" -type d | wc -l)
    local file_count=$(find "$TECH_UIDE_ROOT" -type f | wc -l)
    local total_size=$(du -sh "$TECH_UIDE_ROOT" | cut -f1)
    echo "Directories: $dir_count"
    echo "Files: $file_count"
    echo "Total size: $total_size"
    echo ""
    
    echo "=== KEY FILES ==="
    find "$TECH_UIDE_ROOT" -type f -name "*.txt" | head -10 | while read file; do
        local rel_path=$(echo "$file" | sed 's|.*tech_uide/||')
        local size=$(du -h "$file" | cut -f1)
        echo "• $rel_path ($size)"
    done
    echo ""
    
    echo "=== DIRECTORY SIZES ==="
    for dir in products inventory sales reports employees; do
        if [ -d "$TECH_UIDE_ROOT/$dir" ]; then
            local size=$(du -sh "$TECH_UIDE_ROOT/$dir" | cut -f1)
            local files=$(find "$TECH_UIDE_ROOT/$dir" -type f | wc -l)
            echo "• $dir: $size ($files files)"
        fi
    done
    echo ""
    
    echo "=== NAVIGATION EXAMPLES ==="
    echo "To view products: ls tech_uide/products/"
    echo "To read sales report: cat tech_uide/sales/daily/today.txt"
    echo "To explore structure: find tech_uide/ -type d"
}

export -f display_architecture 