#!/bin/bash

# This script is now interactive. It will ask the user what they want to do.

echo "--- Interactive File & Directory Creation ---"

# Loop to allow creating multiple items
while true; do
    echo ""
    read -p "What do you want to create? (1: Directory, 2: File, 3: Back to Main Menu): " create_choice

    case $create_choice in
        1) # Create Directory
            read -p "Enter the path and name for the new directory (e.g., workspace/new_folder): " dir_name
            if [ -z "$dir_name" ]; then
                echo "Error: Directory name cannot be empty."
            else
                mkdir -p "$dir_name"
                echo "--> Directory '$dir_name' created successfully."
            fi
            ;;
        2) # Create File
            read -p "Enter the path and name for the new file (e.g., workspace/new_file.txt): " file_name
            if [ -z "$file_name" ]; then
                echo "Error: File name cannot be empty."
            else
                # Ensure the parent directory exists before creating the file.
                parent_dir=$(dirname "$file_name")
                mkdir -p "$parent_dir"
                
                touch "$file_name"
                echo "--> File '$file_name' created successfully."
                
                read -p "Do you want to add content to this file now? (y/n): " add_content_choice
                if [ "$add_content_choice" = "y" ]; then
                    read -p "Enter the text content: " content
                    echo "$content" > "$file_name"
                    echo "--> Content added to '$file_name'."
                fi
            fi
            ;;
        3) # Exit
            echo "Returning to the main menu..."
            break
            ;;
        *)
            echo "Invalid option. Please choose 1, 2, or 3."
            ;;
    esac
done

echo "Creating project directory structure..."

mkdir -p workspace/reports/monthly workspace/logs
echo "--> Directories 'workspace/reports/monthly' and 'workspace/logs' created."

touch workspace/data.csv
touch workspace/README.md
echo "--> Empty files 'data.csv' and 'README.md' created in 'workspace/'."

touch workspace/reports/report_jan.txt
touch workspace/reports/report_feb.txt
echo "--> Empty report files created in 'workspace/reports/'."

echo "Initial content for the January report." > workspace/reports/report_jan.txt
echo "--> Added initial content to 'report_jan.txt'."

echo "This is the first line in the README." > workspace/README.md
echo "This is a second line, appended to the README." >> workspace/README.md
echo "--> Added and appended content to 'README.md'." 