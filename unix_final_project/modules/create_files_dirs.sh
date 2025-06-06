#!/bin/bash

# Obtener la ruta absoluta del script y el directorio base
SCRIPT_PATH=$(realpath "$0")
BASE_DIR=$(dirname "$SCRIPT_PATH")
WORKSPACE_DIR=$(dirname $(dirname "$BASE_DIR"))

# Obtener el rol del usuario desde el argumento
role=$1

# Función para crear directorios base
create_base_directories() {
    # Crear directorios principales para la estructura del eCommerce
    mkdir -p "$WORKSPACE_DIR/products" "$WORKSPACE_DIR/orders" "$WORKSPACE_DIR/users"
    echo "Base directories created successfully"
}

# Menú de creación de archivos y directorios
show_create_menu() {
    clear
    echo "=== Create Files and Directories ==="
    echo "1. Create base directory structure"
    echo "2. Create new product file"
    echo "3. Create new order file"
    echo "4. Create new user file"
    echo "5. Return to main menu"
}

# Función para crear un archivo con contenido básico
create_file() {
    local dir=$1
    local type=$2
    local filename
    
    read -p "Enter ${type} name: " filename
    echo "Creating ${type} file: $filename"
    echo "# ${type} details" > "$dir/${filename}.txt"
    echo "Created: $(date)" >> "$dir/${filename}.txt"
    echo "File created successfully"
}

# Bucle principal del menú
while true; do
    show_create_menu
    read -p "Select an option (1-5): " option

    case $option in
        1)
            create_base_directories
            ;;
        2)
            create_file "$WORKSPACE_DIR/products" "product"
            ;;
        3)
            create_file "$WORKSPACE_DIR/orders" "order"
            ;;
        4)
            create_file "$WORKSPACE_DIR/users" "user"
            ;;
        5)
            exit 0
            ;;
        *)
            echo "Invalid option. Press Enter to continue..."
            read
            ;;
    esac
    
    echo "Press Enter to continue..."
    read
done 