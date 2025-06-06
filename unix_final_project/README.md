# TechUIDE Administration System

A modular, terminal-based admin backend for the TechUIDE eCommerce platform.

## Project Structure

```
unix_final_project/
├── main.sh                           # Main entry: login system + interactive menu
└── modules/
    ├── create_files_dirs.sh          # Admin & Employee: File/directory creation
    ├── project_architecture.sh       # Admin & Employee: Project structure viewer
    ├── manage_files.sh              # Admin & Employee: File management
    ├── permissions_links.sh         # Admin full / Employee limited: Permissions
    └── compression_patterns.sh      # Admin & Employee: Compression and search
```

## Features

1. **Role-Based Access Control**
   - Admin users: Full access to all features
   - Employee users: Limited access to certain features

2. **File and Directory Management**
   - Create and organize files/directories
   - View project structure
   - Manage file contents
   - Handle permissions and symbolic links
   - Compression and pattern searching

3. **Security**
   - Login system with role validation
   - Permission-based access control
   - Secure file operations

## Default Users

- Admin: username = "admin"
- Employees: 
  - username = "maria"
  - username = "jose"

## Module Descriptions

1. **create_files_dirs.sh**
   - Create base directory structure
   - Create new product files
   - Create new order files
   - Create new user files

2. **project_architecture.sh**
   - Display project structure
   - Show statistics
   - Visualize directory hierarchy

3. **manage_files.sh**
   - List files
   - View file contents
   - Edit files
   - Delete files

4. **permissions_links.sh**
   - Show file permissions
   - Change permissions (all users)
   - Change ownership (admin only)
   - Create symbolic links (admin only)

5. **compression_patterns.sh**
   - Compress directories
   - Search patterns in files
   - Find files by pattern

## Usage

1. Start the system:
   ```bash
   ./main.sh
   ```

2. Log in with your credentials

3. Use the interactive menu to navigate through features

4. Select options by combining menu number with directory letter
   Example: "1a" for option 1 in Products directory

## Notes

- All scripts use absolute paths for reliability
- Comments are in Spanish for documentation
- Menu and interface are in English
- Error handling is implemented for all operations
- Role-based access control is enforced throughout 