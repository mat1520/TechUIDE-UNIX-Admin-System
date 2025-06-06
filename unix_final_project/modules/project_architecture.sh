#!/bin/bash

# Obtener la ruta absoluta del script y el directorio base
SCRIPT_PATH=$(realpath "$0")
BASE_DIR=$(dirname "$SCRIPT_PATH")
WORKSPACE_DIR=$(dirname $(dirname "$BASE_DIR"))

# Obtener el rol del usuario desde el argumento
role=$1

# Función para mostrar la estructura del proyecto
show_structure() {
    clear
    echo "=== Project Structure ==="
    echo "Workspace directory: $WORKSPACE_DIR"
    echo
    echo "Directory structure:"
    echo "-------------------"
    
    # Mostrar estructura de directorios usando find
    find "$WORKSPACE_DIR" -maxdepth 3 -type d | while read -r dir; do
        # Calcular el nivel de indentación
        level=$(echo "$dir" | tr -cd '/' | wc -c)
        indent=$(printf '%*s' "$((level*2))" '')
        echo "${indent}$(basename "$dir")/"
        
        # Mostrar archivos en el directorio actual
        find "$dir" -maxdepth 1 -type f -printf "%f\n" | while read -r file; do
            echo "${indent}  |- $file"
        done
    done
}

# Función para mostrar estadísticas
show_statistics() {
    echo
    echo "Project Statistics:"
    echo "-----------------"
    echo "Total directories: $(find "$WORKSPACE_DIR" -type d | wc -l)"
    echo "Total files: $(find "$WORKSPACE_DIR" -type f | wc -l)"
    echo "Products: $(find "$WORKSPACE_DIR/products" -type f 2>/dev/null | wc -l)"
    echo "Orders: $(find "$WORKSPACE_DIR/orders" -type f 2>/dev/null | wc -l)"
    echo "Users: $(find "$WORKSPACE_DIR/users" -type f 2>/dev/null | wc -l)"
}

# Menú principal
show_menu() {
    echo
    echo "Options:"
    echo "1. Show project structure"
    echo "2. Show statistics"
    echo "3. Return to main menu"
}

# Bucle principal
while true; do
    show_menu
    read -p "Select an option (1-3): " option

    case $option in
        1)
            show_structure
            ;;
        2)
            show_statistics
            ;;
        3)
            exit 0
            ;;
        *)
            echo "Invalid option. Press Enter to continue..."
            read
            ;;
    esac
    
    echo
    echo "Press Enter to continue..."
    read
done 