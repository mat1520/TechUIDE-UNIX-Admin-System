#!/bin/bash

# This script is interactive for the 'admin' user, but runs a pre-defined
# demonstration for the 'employee' user.

echo "Demonstrating permissions based on user role: $LOGGED_IN_USER"

if [ ! -d "workspace" ]; then
    echo "Error: The 'workspace' directory does not exist. Please run option 1 first."
    exit 1
fi

# Clean up previous runs of this script for a fresh demonstration
rm -rf workspace/admin_area
rm -rf workspace/employee_area

if [ "$LOGGED_IN_USER" = "admin" ]; then
    # --- Admin's Interactive Menu ---
    echo "--- Interactive Permissions & Links Management (Admin) ---"
    while true; do
        echo ""
        echo "Select an operation:"
        echo "1. Change file/directory permissions (chmod)"
        echo "2. Create a link (hard or symbolic)"
        echo "3. Back to Main Menu"
        read -p "Your choice (1-3): " choice

        case $choice in
            1) # Chmod
                read -p "Enter the path of the file/directory to modify: " target_path
                if [ -e "$target_path" ]; then
                    read -p "Enter the new permissions in octal (e.g., 755, 644): " perms
                    # Validate that permissions are a valid octal string
                    if [[ $perms =~ ^[0-7]{3,4}$ ]]; then
                        chmod "$perms" "$target_path"
                        echo "--> Permissions for '$target_path' changed to '$perms'."
                        ls -ld "$target_path"
                    else
                        echo "Error: Invalid permission format. Please use 3 or 4 octal digits (0-7)."
                    fi
                else
                    echo "Error: Target '$target_path' not found."
                fi
                ;;
            2) # Create Link
                read -p "Create a (h)ard or (s)ymbolic link? " link_type
                read -p "Enter the path to the original file (target): " target_file
                if [ -f "$target_file" ]; then
                    read -p "Enter the name for the new link: " link_name
                    if [ -z "$link_name" ]; then
                        echo "Error: Link name cannot be empty."
                    elif [ "$link_type" = "h" ]; then
                        ln "$target_file" "$link_name"
                        echo "--> Hard link '$link_name' created."
                    elif [ "$link_type" = "s" ]; then
                        ln -s "$target_file" "$link_name"
                        echo "--> Symbolic link '$link_name' created."
                    else
                        echo "Error: Invalid link type. Choose 'h' or 's'."
                    fi
                else
                    echo "Error: Target file '$target_file' not found."
                fi
                ;;
            3) # Exit
                echo "Returning to the main menu..."
                break
                ;;
            *)
                echo "Invalid option. Please choose 1-3."
                ;;
        esac
    done

elif [ "$LOGGED_IN_USER" = "employee" ]; then
    # --- Employee's Pre-defined Demonstration ---
    echo "--- Employee Permissions Demonstration ---"
    echo "As an employee, you can see examples of typical permissions."
    
    # Create a temporary area for the demo
    DEMO_DIR="workspace/employee_permissions_demo"
    rm -rf $DEMO_DIR
    mkdir -p $DEMO_DIR
    cd $DEMO_DIR

    echo ""
    echo "Scenario 1: Read-only file (e.g., a final report)"
    echo "Final Report" > company_report.txt
    chmod 444 company_report.txt # r--r--r-- (readable by all for simplicity)
    echo "Permissions for 'company_report.txt' set to 444 (read-only):"
    ls -l company_report.txt

    echo ""
    echo "Scenario 2: Read/Write file (e.g., a working document)"
    echo "Work in progress" > working_draft.txt
    chmod 664 working_draft.txt # rw-rw-r--
    echo "Permissions for 'working_draft.txt' set to 664 (read/write for user/group):"
    ls -l working_draft.txt

    echo ""
    echo "Scenario 3: Read/Execute script (e.g., a tool)"
    echo "#!/bin/bash" > task.sh
    echo "echo 'Running...'" >> task.sh
    chmod 755 task.sh # rwxr-xr-x
    echo "Permissions for 'task.sh' set to 755 (executable):"
    ls -l task.sh
    
    cd ../.. # Return to original directory
fi

echo ""
echo "Permissions demonstration complete." 