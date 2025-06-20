#!/bin/bash

# Create file structure

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TECH_UIDE_ROOT="$PROJECT_ROOT/tech_uide"

create_file_structure() {
    # Create directories
    mkdir -p "$TECH_UIDE_ROOT"/{products/{electronics,clothing,books},inventory,sales/daily,reports/financial,employees}
    echo "Directory structure created..."

    # Create employee files
    cat << 'EOF' > "$TECH_UIDE_ROOT/employees/maria.txt"
Employee ID: 101
Name: Maria Rodriguez
Role: Sales Manager
Start Date: 2023-05-10
Contact: maria.r@techuide.com
EOF

    cat << 'EOF' > "$TECH_UIDE_ROOT/employees/pedro.txt"
Employee ID: 102
Name: Pedro Gonzales
Role: Inventory Specialist
Start Date: 2023-07-22
Contact: pedro.g@techuide.com
EOF
    echo "Employee files created..."

    # Create product files
    cat << 'EOF' > "$TECH_UIDE_ROOT/products/electronics/laptop.txt"
Product ID: ELEC001
Category: Electronics
Item: Laptop Pro 15"
Brand: TechCorp
Specs:
  - CPU: 8-Core
  - RAM: 16GB
  - Storage: 512GB SSD
Price: $1299.99
Stock: 45 units
EOF

    cat << 'EOF' > "$TECH_UIDE_ROOT/products/electronics/keyboard.txt"
Product ID: ELEC002
Category: Electronics
Item: Mechanical Keyboard
Brand: TechCorp
Specs:
  - Type: Full-size
  - Switch: Blue
  - Backlight: RGB
Price: $89.99
Stock: 150 units
EOF

    cat << 'EOF' > "$TECH_UIDE_ROOT/products/electronics/mouse.txt"
Product ID: ELEC003
Category: Electronics
Item: Wireless Mouse
Brand: TechCorp
Specs:
  - DPI: 1600
  - Buttons: 6
  - Connectivity: Bluetooth 5.0
Price: $49.99
Stock: 200 units
EOF

    cat << 'EOF' > "$TECH_UIDE_ROOT/products/clothing/tshirt.txt"
Product ID: CLOTH001
Category: Clothing
Item: Unisex Tech Logo T-Shirt
Brand: StyleWear
Material: 100% Cotton
Sizes: S, M, L, XL
Price: $25.00
Stock: 120 units
EOF

    cat << 'EOF' > "$TECH_UIDE_ROOT/products/clothing/hoodie.txt"
Product ID: CLOTH002
Category: Clothing
Item: Zip-Up Hoodie
Brand: StyleWear
Material: 80% Cotton, 20% Polyester
Sizes: S, M, L, XL
Price: $55.00
Stock: 80 units
EOF

    cat << 'EOF' > "$TECH_UIDE_ROOT/products/clothing/cap.txt"
Product ID: CLOTH003
Category: Clothing
Item: Branded Baseball Cap
Brand: StyleWear
Material: 100% Cotton Twill
Sizes: One Size Fits All
Price: $19.99
Stock: 150 units
EOF

    cat << 'EOF' > "$TECH_UIDE_ROOT/products/books/unix_guide.txt"
Product ID: BOOK001
Category: Books
Item: The Ultimate UNIX Guide
Author: John Doe
ISBN: 978-3-16-148410-0
Price: $45.50
Stock: 75 units
EOF

    cat << 'EOF' > "$TECH_UIDE_ROOT/products/books/python_handbook.txt"
Product ID: BOOK002
Category: Books
Item: Python Developer's Handbook
Author: Jane Smith
ISBN: 978-1-59-327584-6
Price: $39.99
Stock: 90 units
EOF

    cat << 'EOF' > "$TECH_UIDE_ROOT/products/books/git_essentials.txt"
Product ID: BOOK003
Category: Books
Item: Git Essentials: Mastering Version Control
Author: Sam Williams
ISBN: 978-0-73-561967-8
Price: $29.50
Stock: 110 units
EOF
    echo "Product files created..."

    # Create inventory files
    cat << EOF > "$TECH_UIDE_ROOT/inventory/warehouse_status.txt"
Warehouse A:
  - Location: North Zone
  - Capacity: 80%
  - Items: 12,540
  - Last check: 2025-06-19

Warehouse B:
  - Location: South Zone
  - Capacity: 65%
  - Items: 8,900
  - Last check: 2025-06-19
EOF
    echo "Inventory files created..."

    # Create sales and reports
    SALES_DATE="2025-06-19"
    SALES_DAY=$(date -d "$SALES_DATE" +"%A, %B %d, %Y")

    cat << EOF > "$TECH_UIDE_ROOT/sales/daily/sales_$SALES_DATE.txt"
Daily Sales Report: $SALES_DAY
---
Transactions:
- ID: TXN001, Item: ELEC001, Qty: 2, Amount: \$2599.98
- ID: TXN002, Item: CLOTH001, Qty: 5, Amount: \$125.00
- ID: TXN003, Item: BOOK001, Qty: 10, Amount: \$455.00
---
Summary:
Total Orders: 3
Total Revenue: \$3179.98
EOF

    cat << 'EOF' > "$TECH_UIDE_ROOT/reports/financial/Q1_2025_report.txt"
Financial Report - Q1 2025
---
Revenue:
  - Product Sales: $450,000
  - Services: $25,000
  - Total Revenue: $475,000

Expenses:
  - Cost of Goods Sold: $220,000
  - Marketing: $50,000
  - Salaries: $80,000
  - Total Expenses: $350,000

---
Net Profit: $125,000
EOF
    echo "Sales and financial reports created..."
    echo ""
    echo "Structure with detailed files created successfully in $TECH_UIDE_ROOT"
}

reset_file_structure() {
    read -p "Delete and recreate structure? (y/N): " c
    if [[ "$c" == "y" || "$c" == "Y" ]]; then
        echo "Resetting structure..."
        rm -rf "$TECH_UIDE_ROOT"
        create_file_structure
    else
        echo "Reset cancelled."
    fi
}

export -f create_file_structure reset_file_structure 