#!/bin/bash

SCRIPT_DIR=$(dirname "$(realpath "$0")")

login() {
    echo "========================================"
    echo "           Project Login              "
    echo "========================================"
    read -p "Enter username: " username
    read -s -p "Enter password: " password
    echo ""

    if [ "$username" = "admin" ] && [ "$password" = "adminpass" ]; then
        LOGGED_IN_USER="admin"
        export LOGGED_IN_USER
        echo "Login successful. Welcome, admin!"
    elif [ "$username" = "maria" ] && [ "$password" = "mariapass" ]; then
        LOGGED_IN_USER="employee"
        export LOGGED_IN_USER
        echo "Login successful. Welcome, maria!"
    elif [ "$username" = "jose" ] && [ "$password" = "josepass" ]; then
        LOGGED_IN_USER="employee"
        export LOGGED_IN_USER
        echo "Login successful. Welcome, jose!"
    else
        echo "Invalid credentials. Exiting."
        exit 1
    fi
}

login

while true; do
    echo ""
    echo "========================================"
    echo "      UNIX Final Project Main Menu      "
    echo "========================================"
    echo "Logged in as: $LOGGED_IN_USER"
    echo "----------------------------------------"

    # Display menu based on user role
    if [ "$LOGGED_IN_USER" = "admin" ]; then
        echo "1. Create Files & Directories"
        echo "2. Show Project Structure & Paths"
        echo "3. Manage Files"
        echo "4. Manage Permissions (Role-Based)"
        echo "5. Compress & Use Patterns"
        echo "6. Exit"
        read -p "Please select an option (1-6): " choice
    else # Employee Menu
        echo "2. Show Project Structure & Paths"
        echo "4. Manage Permissions (Role-Based)"
        echo "6. Exit"
        read -p "Please select an option (2, 4, or 6): " choice
    fi
    echo ""

    case $choice in
        1)
            if [ "$LOGGED_IN_USER" = "admin" ]; then
                echo "--- Running Module 1: Create Files & Directories ---"
                bash "$SCRIPT_DIR/modules/create_files_dirs.sh"
                echo "--- Module 1 Finished ---"
            else
                echo "Access Denied. This option is for admins only."
            fi
            ;;
        2)
            echo "--- Running Module 2: Show Project Structure & Paths ---"
            bash "$SCRIPT_DIR/modules/project_architecture.sh"
            echo "--- Module 2 Finished ---"
            ;;
        3)
            if [ "$LOGGED_IN_USER" = "admin" ]; then
                echo "--- Running Module 3: Manage Files ---"
                bash "$SCRIPT_DIR/modules/manage_files.sh"
                echo "--- Module 3 Finished ---"
            else
                echo "Access Denied. This option is for admins only."
            fi
            ;;
        4)
            echo "--- Running Module 4: Manage Permissions (Role-Based) ---"
            bash "$SCRIPT_DIR/modules/permissions_links.sh"
            echo "--- Module 4 Finished ---"
            ;;
        5)
            if [ "$LOGGED_IN_USER" = "admin" ]; then
                echo "--- Running Module 5: Compress & Use Patterns ---"
                bash "$SCRIPT_DIR/modules/compression_patterns.sh"
                echo "--- Module 5 Finished ---"
            else
                echo "Access Denied. This option is for admins only."
            fi
            ;;
        6)
            echo "Exiting the program. Goodbye!"
            break
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
done