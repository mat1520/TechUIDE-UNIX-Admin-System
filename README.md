# TechUIDE UNIX Administration System

## Overview

This project is a modular, terminal-based UNIX administration system that simulates the backend operations for a fictional eCommerce platform called **TechUIDE**. It serves as an interactive, menu-driven Bash tool for learning and demonstrating fundamental UNIX/Linux commands in a practical context.

The entire application is built to be robust and portable, featuring role-based access, user-friendly prompts, input validation, and comprehensive error handling.

## Features

- **Role-Based Access Control (RBAC):**
  - **Admin:** Full access to all modules for system-wide operations.
  - **Employee:** Restricted access to a safe subset of functions relevant to daily tasks.
- **Interactive Modules:** Each module provides a sub-menu for specific, interactive operations.
  - **File & Directory Creation:** Create new product files, order directories, or user profiles.
  - **File Management:** Interactively view (`cat`), rename (`mv`), move (`mv`), and delete (`rm`) files.
  - **Permissions & Links:** Admins can interactively manage permissions (`chmod`) and links (`ln`). Employees are shown a safe, role-specific demonstration.
  - **Compression & Search:** Interactively create archives (`tar`, `zip`), compress files (`gzip`), and find files using wildcard patterns (`ls`).
- **Portability:** Uses `realpath` to ensure scripts can be run from any directory.
- **Robustness:** Includes input validation and error handling across all modules to prevent crashes from common user errors.

## How to Run

### Prerequisites
- A UNIX-like environment (Linux, macOS, or WSL on Windows).
- The `bash` shell.
- `tree`, `zip`, and `gzip` commands should be installed.

### Execution
1.  Navigate to the project's root directory.
2.  Run the main script: `bash main.sh`

### User Credentials

- **Admin User:**
  - **Username:** `admin`
  - **Password:** `adminpass`
- **Employee Users:** (Role: `employee`)
  - **Username:** `maria` / **Password:** `mariapass`
  - **Username:** `jose` / **Password:** `josepass`

## Project Structure

```
./
├── main.sh
├── README.md
└── modules/
    ├── create_files_dirs.sh
    ├── project_architecture.sh
    ├── manage_files.sh
    ├── permissions_links.sh
    └── compression_patterns.sh
```