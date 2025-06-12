#!/bin/bash

# This script is now interactive. It provides a menu for compression and pattern matching.

echo "--- Interactive Compression & Pattern Matching ---"

while true; do
    echo ""
    echo "Select an operation:"
    echo "1. Create a .tar archive"
    echo "2. Compress a file with gzip"
    echo "3. Create a .zip archive"
    echo "4. List files using a pattern (ls)"
    echo "5. Back to Main Menu"
    read -p "Your choice (1-5): " choice

    case $choice in
        1) # Create .tar
            read -p "Enter the path of the directory/file to archive: " source_path
            if [ -e "$source_path" ]; then
                read -p "Enter the name for the new .tar file (e.g., my_archive.tar): " archive_name
                if [ -z "$archive_name" ]; then
                    echo "Error: Archive name cannot be empty."
                else
                    tar -cvf "$archive_name" "$source_path"
                    echo "--> Archive '$archive_name' created."
                fi
            else
                echo "Error: Source '$source_path' not found."
            fi
            ;;
        2) # Gzip a file
            read -p "Enter the path of the file to compress with gzip: " file_to_gzip
            if [ -f "$file_to_gzip" ]; then
                gzip "$file_to_gzip"
                echo "--> File compressed to '$file_to_gzip.gz'."
            else
                echo "Error: File '$file_to_gzip' not found."
            fi
            ;;
        3) # Create .zip
            read -p "Enter the path of the directory/file to zip: " source_path
            if [ -e "$source_path" ]; then
                read -p "Enter the name for the new .zip file (e.g., my_archive.zip): " archive_name
                if [ -z "$archive_name" ]; then
                    echo "Error: Archive name cannot be empty."
                else
                    zip -r "$archive_name" "$source_path"
                    echo "--> Archive '$archive_name' created."
                fi
            else
                echo "Error: Source '$source_path' not found."
            fi
            ;;
        4) # List with pattern
            read -p "Enter a path and pattern to list (e.g., 'workspace/*.txt'): " pattern
            echo "--- Listing files matching '$pattern' ---"
            # We use `eval` here to force the shell to expand the wildcard characters (*, ?, etc.)
            # that are stored inside the $pattern variable. Without `eval`, `ls` would look for a
            # literal file named "*.txt", which is not what we want.
            # The -d flag prevents `ls` from listing the content of directories that match the pattern.
            eval ls -ld $pattern
            echo "----------------------------------------"
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