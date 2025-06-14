# TechUIDE UNIX Administration System

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Shell Script](https://img.shields.io/badge/Shell_Script-121011?style=flat&logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)

## 📋 Overview

TechUIDE UNIX Administration System is a comprehensive, modular terminal-based administration system that simulates backend operations for the fictional eCommerce platform **TechUIDE**. This project serves as both a practical learning tool and a demonstration of fundamental UNIX/Linux system administration concepts.

Built with robustness and portability in mind, the system features role-based access control, intuitive user interfaces, comprehensive input validation, and extensive error handling mechanisms.

## ✨ Key Features

### 🔐 Role-Based Access Control (RBAC)
- **Administrator Role**
  - Full system access and control
  - Advanced file operations
  - Permission management
  - System-wide configurations
- **Employee Role**
  - Restricted access to essential functions
  - Safe operation environment
  - Task-specific permissions

### 🛠️ Core Functionality
- **File System Operations**
  - Interactive file and directory creation
  - Advanced file management (view, rename, move, delete)
  - Permission management and symbolic links
  - Compression and archiving capabilities
- **System Management**
  - User authentication and authorization
  - Directory structure management
  - File pattern matching and search
  - System status monitoring

### 💪 Technical Features
- **Portability**
  - Cross-platform compatibility
  - `realpath` implementation for universal path resolution
  - Environment-agnostic execution
- **Security**
  - Input sanitization
  - Permission validation
  - Secure credential management
- **Robustness**
  - Comprehensive error handling
  - Input validation
  - Graceful failure recovery

## 🚀 Getting Started

### Prerequisites
- UNIX-like environment (Linux, macOS, or WSL on Windows)
- Bash shell (version 4.0 or higher)
- Required packages:
  ```bash
  tree
  zip
  gzip
  ```

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/mat1520/TechUIDE-UNIX-Admin-System.git
   ```
2. Navigate to the project directory:
   ```bash
   cd TechUIDE-UNIX-Admin-System
   ```
3. Make the main script executable:
   ```bash
   chmod +x main.sh
   ```
4. Run the application:
   ```bash
   ./main.sh
   ```

### Default Credentials

#### Administrator
- **Username:** `admin`
- **Password:** `adminpass`

#### Employee Users
- **Username:** `maria`
- **Password:** `mariapass`

- **Username:** `jose`
- **Password:** `josepass`

## 📁 Project Structure

```
./
├── main.sh                 # Main application entry point
├── README.md              # Project documentation
└── modules/               # Core functionality modules
    ├── create_files_dirs.sh    # File and directory creation
    ├── project_architecture.sh # System architecture management
    ├── manage_files.sh         # File operations
    ├── permissions_links.sh    # Permission and link management
    └── compression_patterns.sh # Compression and pattern matching
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Authors

- **Mat1520** - *Initial work* - [GitHub Profile](https://github.com/mat1520)

## 🙏 Acknowledgments

- Thanks to all contributors who have helped shape this project
- Inspired by real-world UNIX/Linux system administration practices
- Built with the goal of making system administration more accessible