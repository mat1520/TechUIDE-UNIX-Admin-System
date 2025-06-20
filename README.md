# TechUIDE UNIX Administration System

A modular Bash-based UNIX administration system simulating backend operations for the **TechUIDE** eCommerce platform. This project provides a hands-on, terminal-based experience for managing a simulated commercial environment, focusing on core UNIX commands and shell scripting.

## ✨ Key Features

-   **Role-Based Access Control (RBAC)**: Differentiated menus and permissions for `admin`, `maria`, and `pedro`.
-   **Modular Design**: Functionality is split across logical modules for clarity and maintainability.
-   **Interactive Menus**: A user-friendly, color-coded interface for easy navigation.
-   **Core UNIX Operations**: Demonstrates a wide range of commands for file management, permissions, compression, and searching.
-   **Dynamic Structure Creation**: Scripts to automatically generate a realistic and detailed directory and file structure.

---

## 🚀 Application Flow

This diagram illustrates the user flow, from authentication to accessing the different system modules.

graph TD
    A[Start] --> B{Authenticate};
    B -->|Success| C[Show Main Menu];
    B -->|Failure| B;
    C --> D{Select Option};
    D -->|1. View Structure| E[project_architecture.sh];
    D -->|2. File Management| F[manage_files.sh];
    D -->|3. Compress/Search| G[compression_patterns.sh];
    D -->|4. Create/Reset| H[create_files_dirs.sh];
    D -->|5. Permissions/Links| I[permissions_links.sh];
    D -->|6. Exit| J[End];
    E --> C;
    F --> C;
    G --> C;
    H --> C;
    I --> C;
    
    subgraph Admin Only
        H;
        I;
    end
    
    style B fill:#f9f,stroke:#333,stroke-width:2px
    style C fill:#ccf,stroke:#333,stroke-width:2px
    style J fill:#f99,stroke:#333,stroke-width:2px

---

## 📁 Project Structure

The system generates and manages the following directory structure within the `tech_uide` folder.

graph TD
    subgraph "Tech UIDE E-commerce System"
        A("unix_final_project/")
        A --> B("main.sh");
        A --> C("modules/");
        A --> D("tech_uide/");
        
        C --> C1("create_files_dirs.sh");
        C --> C2("manage_files.sh");
        C --> C3("compression_patterns.sh");
        C --> C4("permissions_links.sh");
        C --> C5("project_architecture.sh");

        D --> D1("employees/");
        D --> D2("products/");
        D --> D3("inventory/");
        D --> D4("sales/");
        D --> D5("reports/");

        D1 --> E1("maria.txt");
        D1 --> E2("pedro.txt");

        D2 --> F1("electronics/");
        D2 --> F2("clothing/");
        D2 --> F3("books/");
        
        F1 --> G1("laptop.txt");
        F1 --> G2("keyboard.txt");
        F1 --> G3("mouse.txt");

        F2 --> H1("tshirt.txt");
        F2 --> H2("hoodie.txt");
        F2 --> H3("cap.txt");

        F3 --> I1("unix_guide.txt");
        F3 --> I2("python_handbook.txt");
        F3 --> I3("git_essentials.txt");

        D3 --> J1("warehouse_status.txt");
        D4 --> K1("daily/");
        K1 --> L1("sales_YYYY-MM-DD.txt");
        D5 --> M1("financial/");
        M1 --> N1("Q1_2025_report.txt");
    end

---

## 🛠️ Getting Started

### Prerequisites

-   A UNIX-like environment (Linux, macOS, or WSL on Windows).
-   `bash` shell.
-   The `tree` command is recommended for a better visual representation of the directory structure (optional).

### Installation & Usage

1.  **Clone the Repository**
    ```sh
    git clone https://github.com/mat1520/TechUIDE-UNIX-Admin-System.git
    cd TechUIDE-UNIX-Admin-System
    ```

2.  **Set Executable Permissions**
    Make the main script and all modules executable:
    ```sh
    chmod +x main.sh modules/*.sh
    ```

3.  **Run the Application**
    ```sh
    ./main.sh
    ```

4.  **Login**
    Use one of the available usernames when prompted: `admin`, `maria`, or `pedro`.

---

## ⚙️ Modules Overview

-   `main.sh`: The entry point of the application. Handles user authentication and the main menu.
-   `modules/create_files_dirs.sh`: Creates the initial directory and file structure for the simulation. (Admin only)
-   `modules/project_architecture.sh`: Displays a detailed view of the project structure, including statistics.
-   `modules/manage_files.sh`: Provides tools for file manipulation (read, write, move, copy, delete).
-   `modules/permissions_links.sh`: Manages file/directory permissions and creates symbolic/hard links. (Admin only)
-   `modules/compression_patterns.sh`: Compresses directories into archives and searches for files by pattern or content.

## Features

- **Role-based access control** (`admin`, `maria`, `pedro`)
- **Basic file management** operations
- **Compression and pattern matching** using standard UNIX tools
- **Permission and link management** for security
- **Simple interface** with clear menus

## Structure

- `main.sh`: Main script with user interface
- `modules/`: Contains all functional scripts
- `tech_uide/`: The root directory for the simulated company, created at runtime

## How to Run

1. **Open a UNIX-like terminal** (like Git Bash on Windows, or any terminal on Linux/macOS/WSL).
2. Navigate to the `unix_final_project` directory.
3. Make the scripts executable:
   ```bash
   chmod +x main.sh modules/*.sh
   ```
4. Run the main script:
   ```bash
   ./main.sh
   ```
5. Follow the on-screen prompts. Start by logging in as `admin` and using option `4` to create the file structure.

## Available Users

- `admin`: Full access to all features
- `maria`: Limited access (cannot delete files or manage permissions)
- `pedro`: Limited access (cannot delete files or manage permissions)

## Functionality Overview

### 1. View Project Structure
- Complete directory tree visualization
- File and directory statistics
- Key file identification
- Navigation examples

### 2. File Management
- **Read files** with content display
- **Write/append** to existing files
- **Move/rename** files safely
- **List directories** with detailed view
- **Create new files** with content
- **Copy files** between locations
- **Delete files** (admin only, with confirmation)

### 3. Compression & Search
- **Create archives** (TAR, GZIP, ZIP formats)
- **Extract archives** to specified locations
- **Search by pattern** (filename or extension)
- **Search by content** using grep

### 4. Create/Reset Structure (Admin Only)
- Create complete e-commerce directory structure
- Generate sample business data
- Reset structure with confirmation

### 5. Permissions & Links (Admin Only)
- **View permissions** for files and directories
- **Set file permissions** with common options
- **Set directory permissions** with safety options
- **Create symbolic links** for quick access
- **Create hard links** for backup purposes
- **View all links** in the system

## Learning Benefits

This system helps beginners learn:

- **Basic UNIX commands** (ls, cd, mkdir, cp, mv, rm, etc.)
- **File system navigation** and path concepts
- **Permission management** and security
- **File operations** and data manipulation
- **Search and pattern matching**
- **Archive creation** and compression
- **Link management** concepts

## Safety Features

- **Confirmation prompts** for destructive operations
- **Role-based restrictions** to prevent accidents
- **Input validation** and error handling
- **Clear feedback** for all operations

## Business Context

The simulated e-commerce structure includes:
- Product catalogs and inventory
- Sales tracking and reports
- Employee directories
- Financial reports

This provides a realistic context for learning UNIX file management in a business environment. 