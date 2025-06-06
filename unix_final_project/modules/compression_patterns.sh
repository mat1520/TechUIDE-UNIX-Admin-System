#!/bin/bash

# Obtener la ruta absoluta del script y el directorio base
SCRIPT_PATH=$(realpath "$0")
BASE_DIR=$(dirname "$SCRIPT_PATH")
WORKSPACE_DIR=$(dirname $(dirname "$BASE_DIR"))

# Obtener el rol del usuario desde el argumento
role=$1

# Función para comprimir un directorio
compress_directory() {
    local dir=$1
    local dir_name=$(basename "$dir")
    local timestamp=$(date +%Y%m%d_%H%M%S)
    local archive_name="${dir_name}_${timestamp}"
    
    echo "Compressing $dir_name..."
    
    # Crear archivo tar.gz
    tar -czf "${archive_name}.tar.gz" -C "$(dirname "$dir")" "$dir_name"
    
    if [ $? -eq 0 ]; then
        echo "Directory compressed successfully: ${archive_name}.tar.gz"
    else
        echo "Failed to compress directory"
    fi
}

# Función para buscar patrones en archivos
search_pattern() {
    local dir=$1
    
    read -p "Enter search pattern: " pattern
    echo "Searching for '$pattern' in $dir..."
    echo "-----------------------------------"
    
    # Buscar el patrón en todos los archivos del directorio
    grep -r "$pattern" "$dir" 2>/dev/null
    
    if [ $? -eq 1 ]; then
        echo "Pattern not found"
    fi
}

# Función para buscar archivos por nombre
find_files() {
    local dir=$1
    
    read -p "Enter filename pattern (e.g., *.txt): " pattern
    echo "Finding files matching '$pattern' in $dir..."
    echo "-------------------------------------------"
    
    # Buscar archivos que coincidan con el patrón
    find "$dir" -name "$pattern" 2>/dev/null
    
    if [ $? -eq 1 ]; then
        echo "No matching files found"
    fi
}

# Menú principal
show_menu() {
    clear
    echo "=== Compression and Search ==="
    echo "1. Compress directory"
    echo "2. Search pattern in files"
    echo "3. Find files by pattern"
    echo "4. Return to main menu"
    echo
    echo "Select directory:"
    echo "a) Products"
    echo "b) Orders"
    echo "c) Users"
    echo "d) All directories"
}

# Bucle principal
while true; do
    show_menu
    read -p "Select option and directory (e.g., 1a): " choice
    
    option=${choice:0:1}
    dir_choice=${choice:1:1}
    
    case $dir_choice in
        a) dir="$WORKSPACE_DIR/products" ;;
        b) dir="$WORKSPACE_DIR/orders" ;;
        c) dir="$WORKSPACE_DIR/users" ;;
        d) dir="$WORKSPACE_DIR" ;;
        *) dir="" ;;
    esac
    
    if [ -z "$dir" ]; then
        echo "Invalid directory choice"
        continue
    fi
    
    case $option in
        1)
            compress_directory "$dir"
            ;;
        2)
            search_pattern "$dir"
            ;;
        3)
            find_files "$dir"
            ;;
        4)
            exit 0
            ;;
        *)
            echo "Invalid option"
            ;;
    esac
    
    echo
    echo "Press Enter to continue..."
    read
done 