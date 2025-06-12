#!/bin/bash

echo "Visualizing project architecture and paths..."

if [ ! -d "workspace" ]; then
    echo "Error: The 'workspace' directory does not exist. Please run option 1 first."
    exit 1
fi

echo ""
echo "--- Displaying Directory Tree ---"
if command -v tree >/dev/null 2>&1; then
    tree workspace
else
    echo "Info: The 'tree' command is not installed."
    echo "You can typically install it with 'sudo apt-get install tree' or 'sudo yum install tree'."
    echo "Listing contents with 'ls -R':"
    ls -R workspace
fi

echo ""
echo "--- Displaying Absolute Path of a File ---"
if [ -f "workspace/reports/report_jan.txt" ]; then
    echo "The absolute path for 'report_jan.txt' is:"
    realpath workspace/reports/report_jan.txt
else
    echo "Info: 'workspace/reports/report_jan.txt' not found."
fi


echo ""
echo "--- Displaying Current Working Directory ---"
echo "The current working directory is:"
pwd

echo ""
echo "Path demonstration complete." 