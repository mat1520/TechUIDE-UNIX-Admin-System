#!/bin/bash

# This script is now interactive. It presents a menu for file management operations.

echo "--- Interactive File Management ---"

while true; do
    echo ""
    echo "Select an operation:"
    echo "1. Display file content (cat)"
    echo "2. Rename a file (mv)"
    echo "3. Move a file (mv)"
    echo "4. Delete a file (rm)"
    echo "5. Back to Main Menu"
    read -p "Your choice (1-5): " choice

    case $choice in
        1) # Display content
            read -p "Enter the path of the file to display: " file_path
            if [ -f "$file_path" ]; then
                echo "--- Content of $file_path ---"
                cat "$file_path"
                echo "---------------------------"
            else
                echo "Error: File '$file_path' not found."
            fi
            ;;
        2) # Rename file
            read -p "Enter the current path of the file to rename: " old_name
            if [ -f "$old_name" ]; then
                read -p "Enter the new name for the file (just the name, not the path): " new_name
                if [ -z "$new_name" ]; then
                    echo "Error: New name cannot be empty."
                else
                    dir_path=$(dirname "$old_name")
                    mv "$old_name" "$dir_path/$new_name"
                    echo "--> File renamed to '$new_name' in directory '$dir_path'."
                fi
            else
                echo "Error: File '$old_name' not found."
            fi
            ;;
        3) # Move file
            read -p "Enter the path of the file to move: " file_to_move
            if [ -f "$file_to_move" ]; then
                read -p "Enter the destination directory: " dest_dir
                if [ -z "$dest_dir" ]; then
                    echo "Error: Destination directory cannot be empty."
                elif [ -d "$dest_dir" ]; then
                    mv "$file_to_move" "$dest_dir"
                    echo "--> File moved to '$dest_dir'."
                else
                    echo "Error: Destination directory '$dest_dir' does not exist."
                fi
            else
                echo "Error: File '$file_to_move' not found."
            fi
            ;;
        4) # Delete file
            read -p "Enter the path of the file to delete: " file_to_delete
            if [ -f "$file_to_delete" ]; then
                read -p "Are you sure you want to permanently delete '$file_to_delete'? (y/n): " confirm
                if [ "$confirm" = "y" ]; then
                    rm "$file_to_delete"
                    echo "--> File '$file_to_delete' deleted."
                else
                    echo "Deletion cancelled."
                fi
            else
                echo "Error: File '$file_to_delete' not found."
            fi
            ;;
        5) # Exit
            echo "Returning to the main menu..."
            break
            ;;
        *)
            echo "Invalid option. Please choose 1-5."
            ;;
    esac
done 