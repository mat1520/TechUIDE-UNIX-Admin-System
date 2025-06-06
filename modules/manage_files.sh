#!/bin/bash

# Obtener la ruta absoluta del script y el directorio base
SCRIPT_PATH=$(realpath "$0")
BASE_DIR=$(dirname "$SCRIPT_PATH")
WORKSPACE_DIR=$(dirname $(dirname "$BASE_DIR"))

# Obtener el rol del usuario desde el argumento
role=$1

# Función para verificar permisos de administrador
check_admin() {
    if [ "$role" != "admin" ]; then
        echo "Permission denied: This operation requires administrator privileges"
        return 1
    fi
    return 0
}

# Función para listar archivos de un directorio específico
list_files() {
    local dir=$1
    echo "Files in ${dir}:"
    echo "----------------"
    ls -l "$dir" 2>/dev/null || echo "No files found"
}

# Función para ver contenido de un archivo
view_file() {
    local dir=$1
    echo "Available files:"
    ls "$dir"
    
    read -p "Enter filename to view: " filename
    if [ -f "$dir/$filename" ]; then
        echo "Content of $filename:"
        echo "-------------------"
        cat "$dir/$filename"
    else
        echo "File not found"
    fi
}

# Función para editar un archivo
edit_file() {
    if ! check_admin; then
        return 1
    fi
    
    local dir=$1
    echo "Available files:"
    ls "$dir"
    
    read -p "Enter filename to edit: " filename
    if [ -f "$dir/$filename" ]; then
        echo "Current content:"
        cat "$dir/$filename"
        echo "Enter new content (Ctrl+D to finish):"
        cat > "$dir/$filename"
        echo "File updated successfully"
    else
        echo "File not found"
    fi
}

# Función para eliminar un archivo
delete_file() {
    if ! check_admin; then
        return 1
    fi
    
    local dir=$1
    echo "Available files:"
    ls "$dir"
    
    read -p "Enter filename to delete: " filename
    if [ -f "$dir/$filename" ]; then
        rm -i "$dir/$filename"
        echo "File deleted successfully"
    else
        echo "File not found"
    fi
}

# Menú principal
show_menu() {
    clear
    echo "=== File Management ==="
    if [ "$role" = "admin" ]; then
        echo "1. List files"
        echo "2. View file"
        echo "3. Edit file"
        echo "4. Delete file"
        echo "5. Return to main menu"
    else
        echo "1. List files"
        echo "2. View file"
        echo "3. Return to main menu"
    fi
    echo
    echo "Select directory:"
    echo "a) Products"
    echo "b) Orders"
    echo "c) Users"
}

# Bucle principal
while true; do
    show_menu
    if [ "$role" = "admin" ]; then
        read -p "Select option (1-5) and directory (a-c) (e.g., 1a): " choice
    else
        read -p "Select option (1-3) and directory (a-c) (e.g., 1a): " choice
    fi
    
    option=${choice:0:1}
    dir_choice=${choice:1:1}
    
    case $dir_choice in
        a) dir="$WORKSPACE_DIR/products" ;;
        b) dir="$WORKSPACE_DIR/orders" ;;
        c) dir="$WORKSPACE_DIR/users" ;;
        *) dir="" ;;
    esac
    
    if [ -z "$dir" ]; then
        echo "Invalid directory choice"
        read -p "Press Enter to continue..."
        continue
    fi
    
    if [ "$role" = "admin" ]; then
        case $option in
            1)
                list_files "$dir"
                ;;
            2)
                view_file "$dir"
                ;;
            3)
                edit_file "$dir"
                ;;
            4)
                delete_file "$dir"
                ;;
            5)
                exit 0
                ;;
            *)
                echo "Invalid option"
                ;;
        esac
    else
        case $option in
            1)
                list_files "$dir"
                ;;
            2)
                view_file "$dir"
                ;;
            3)
                exit 0
                ;;
            *)
                echo "Invalid option"
                ;;
        esac
    fi
    
    echo
    read -p "Press Enter to continue..."
done 