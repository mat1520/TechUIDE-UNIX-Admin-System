<div align="center">
  <img src="assets/LOGO.png" alt="TechUIDE Logo" width="150"/>
  <h1>TechUIDE UNIX Administration System</h1>
  <p><strong>🚀 Your Interactive Sandbox for Mastering the UNIX Command Line 🚀</strong></p>

  <p>
    <img src="https://img.shields.io/badge/Shell_Script-121011?style=for-the-badge&logo=gnu-bash&logoColor=white" alt="Language">
    <img src="https://img.shields.io/badge/License-MIT-blue.svg?style=for-the-badge" alt="License: MIT">
  </p>
</div>

---

## 🎯 **Project Mission**

Imagine you're the new System Administrator for **TechUIDE**, a growing e-commerce company. Your mission is to manage the company's entire backend—from product catalogs to financial reports—using only a UNIX terminal.

This project isn't just a tutorial; it's a **fully interactive learning environment**. It transforms abstract commands into practical skills by giving you a real-world playground to explore, manage, and even break (and fix!).

---

## ✨ **Core Features & Learning Objectives**

This system is built around a set of core modules, each designed to teach you a fundamental aspect of UNIX administration:

-   🔐 **Role-Based Access Control**: Step into the shoes of a powerful `admin` or a standard `employee`. See firsthand how permissions change what you can see and do.

-   🗂️ **Realistic File & Directory Management**: Go beyond `touch` and `mkdir`. You'll be creating product files, updating inventory logs, archiving sales reports, and managing a logical business structure.

-   🛡️ **Permission & Security Simulation**: Learn the power and importance of `chmod`. Make scripts executable, protect sensitive financial data by making it read-only, and manage directory access.

-   🔎 **Powerful Search & Pattern Matching**: Use `grep` to instantly find products by name within files and `find` to locate any file or directory based on powerful patterns.

-   🗜️ **Data Compression & Archiving**: Practice using `tar`, `gzip`, and `zip` to bundle up old sales data for storage, a common task for any system administrator.

-   🔗 **Efficient Link Management**: Understand the practical difference between symbolic links (`ln -s`) for creating convenient shortcuts and hard links for creating file backups.

---

## 🚀 **Visualizing the System**

Click the dropdowns below to see a visual breakdown of the application's flow and the company structure you'll be managing.

<details>
  <summary><strong>Click to view ► 🗺️ Application Menu Flow</strong></summary>
  <br>
  <em>This diagram shows how a user navigates through the system, from login to the various admin modules.</em>
  <br><br>

```mermaid
graph TD
    A[Start] --> B{Authenticate User};
    B -->|✅ Valid| C[Main Menu];
    B -->|❌ Invalid| B;
    C --> D{Select Module};
    D -->|View Structure| E[project_architecture.sh];
    D -->|File Management| F[manage_files.sh];
    D -->|Compress/Search| G[compression_patterns.sh];
    D -->|"Create/Reset (Admin)"| H[create_files_dirs.sh];
    D -->|"Permissions/Links (Admin)"| I[permissions_links.sh];
    D -->|Exit| J[End Session];
    E --> C;
    F --> C;
    G --> C;
    H --> C;
    I --> C;
    
    style B fill:#84a98c,stroke:#333,stroke-width:2px
    style C fill:#cad2c5,stroke:#333,stroke-width:2px
    style J fill:#d90429,stroke:#333,stroke-width:2px
```
</details>

<details>
  <summary><strong>Click to view ► 🗂️ Simulated Company Directory</strong></summary>
  <br>
  <em>This diagram shows the complete file and folder hierarchy for the "TechUIDE" company. This is your digital workspace.</em>
  <br><br>

```mermaid
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
```
</details>

---

## 🛠️ **Quick Start Guide**

Get up and running in under a minute with these three steps.

| Step | Command                                                                                                      | Description                                                                 |
| :--: | ------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------- |
|  1.  | `git clone https://github.com/mat1520/TechUIDE-UNIX-Admin-System.git`<br/>`cd TechUIDE-UNIX-Admin-System/unix_final_project` | Clone the repository and navigate into the project directory.               |
|  2.  | `chmod +x main.sh modules/*.sh`                                                                              | Make all the necessary scripts executable. This only needs to be done once. |
|  3.  | `./main.sh`                                                                                                  | Run the main application script to start the system.                        |

> **💡 Pro Tip:** After starting the system, log in as `admin` and select **Option 4** to create the initial file structure. Then, you're ready to explore!

---

## 👥 **User Roles & Permissions**

The system features two distinct user roles to simulate a real-world IT environment:

-   👑 **Administrator (`admin`)**: Possesses full control. Can create/delete files, manage permissions, and access all system modules.
-   👤 **Employee (`maria` & `pedro`)**: Represents standard users with restricted access. They can view data and perform basic file operations but are blocked from sensitive or destructive actions.

---

## ✍️ **Author**

This project was developed by **mat1520**.

<p align="center">
  <a href="https://github.com/mat1520">
    <img src="https://img.shields.io/badge/GitHub-Profile-181717?style=for-the-badge&logo=github&logoColor=white" alt="GitHub Profile">
  </a>
</p> 