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

# Función para mostrar permisos actuales
show_permissions() {
    local dir=$1
    echo "Current permissions in ${dir}:"
    echo "-------------------------"
    ls -l "$dir"
}

# Función para cambiar permisos
change_permissions() {
    if ! check_admin; then
        return 1
    fi
    
    local dir=$1
    echo "Available files:"
    ls "$dir"
    
    read -p "Enter filename: " filename
    if [ ! -e "$dir/$filename" ]; then
        echo "File not found"
        return 1
    }
    
    read -p "Enter new permissions (e.g., 644): " perms
    chmod "$perms" "$dir/$filename" 2>/dev/null
    
    if [ $? -eq 0 ]; then
        echo "Permissions changed successfully"
        ls -l "$dir/$filename"
    else
        echo "Failed to change permissions"
    fi
}

# Función para cambiar propietario (solo admin)
change_owner() {
    if ! check_admin; then
        return 1
    }
    
    local dir=$1
    echo "Available files:"
    ls "$dir"
    
    read -p "Enter filename: " filename
    if [ ! -e "$dir/$filename" ]; then
        echo "File not found"
        return 1
    }
    
    read -p "Enter new owner: " owner
    chown "$owner" "$dir/$filename" 2>/dev/null
    
    if [ $? -eq 0 ]; then
        echo "Owner changed successfully"
        ls -l "$dir/$filename"
    else
        echo "Failed to change owner"
    fi
}

# Función para crear enlaces simbólicos (solo admin)
create_symlink() {
    if ! check_admin; then
        return 1
    }
    
    local dir=$1
    echo "Available files in $dir:"
    ls "$dir"
    
    read -p "Enter source filename: " source
    if [ ! -e "$dir/$source" ]; then
        echo "Source file not found"
        return 1
    }
    
    read -p "Enter link name: " link
    ln -s "$dir/$source" "$dir/$link" 2>/dev/null
    
    if [ $? -eq 0 ]; then
        echo "Symbolic link created successfully"
        ls -l "$dir/$link"
    else
        echo "Failed to create symbolic link"
    fi
}

# Menú principal
show_menu() {
    clear
    echo "=== Permissions and Links ==="
    if [ "$role" = "admin" ]; then
        echo "1. Show permissions"
        echo "2. Change permissions"
        echo "3. Change owner"
        echo "4. Create symbolic link"
        echo "5. Return to main menu"
    else
        echo "1. Show permissions"
        echo "2. Return to main menu"
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
        read -p "Select option (1-2) and directory (a-c) (e.g., 1a): " choice
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
                show_permissions "$dir"
                ;;
            2)
                change_permissions "$dir"
                ;;
            3)
                change_owner "$dir"
                ;;
            4)
                create_symlink "$dir"
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
                show_permissions "$dir"
                ;;
            2)
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