#!/bin/bash

# Obtener la ruta absoluta del script y el directorio base
SCRIPT_PATH=$(realpath "$0")
BASE_DIR=$(dirname "$SCRIPT_PATH")

# Declaración del array asociativo para usuarios y roles
declare -A users_roles
users_roles["admin"]="admin"
users_roles["maria"]="employee"
users_roles["jose"]="employee"

# Función para validar las credenciales
validate_credentials() {
    local username=$1
    if [[ -n "${users_roles[$username]}" ]]; then
        return 0
    fi
    return 1
}

# Sistema de login
echo "=== TECHUIDE LOGIN SYSTEM ==="
read -p "Username: " username

if validate_credentials "$username"; then
    role=${users_roles[$username]}
    echo "Welcome $username (Role: $role)"
else
    echo "Invalid credentials"
    exit 1
fi

# Función para mostrar el menú
show_menu() {
    clear
    echo "=== TECHUIDE ADMINISTRATION MENU ==="
    echo "1. Create files and directories"
    echo "2. Project architecture"
    echo "3. File management"
    echo "4. Permissions and links"
    echo "5. Compression and search"
    echo "6. Exit"
}

# Bucle principal del menú
while true; do
    show_menu
    read -p "Select an option (1-6): " option

    # Validar que la opción sea un número
    if ! [[ "$option" =~ ^[1-6]$ ]]; then
        echo "Invalid option. Please enter a number between 1 and 6."
        read -p "Press Enter to continue..."
        continue
    fi

    case $option in
        1)
            bash "$BASE_DIR/modules/create_files_dirs.sh" "$role"
            ;;
        2)
            bash "$BASE_DIR/modules/project_architecture.sh" "$role"
            ;;
        3)
            bash "$BASE_DIR/modules/manage_files.sh" "$role"
            ;;
        4)
            bash "$BASE_DIR/modules/permissions_links.sh" "$role"
            ;;
        5)
            bash "$BASE_DIR/modules/compression_patterns.sh" "$role"
            ;;
        6)
            echo "Thank you for using TechUIDE Administration System"
            exit 0
            ;;
    esac
done 