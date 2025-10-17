#!/bin/bash

# Copilot Shell Script - Update assignment and check submissions

echo "============================================"
echo "   Assignment Reminder Copilot Script"
echo "============================================"
echo ""

# Prompt user for the assignment name
echo "Enter the new assignment name:"
read assignment_name

# Check if the user entered something
if [ -z "$assignment_name" ]; then
    echo "Error: Assignment name cannot be empty!"
    exit 1
fi

# Path to the config file
config_file="./config/config.env"

# Check if config.env exists
if [ ! -f "$config_file" ]; then
    echo "Error: config.env file not found at $config_file"
    exit 1
fi

# Use sed to replace the ASSIGNMENT value in config.env
# This finds the line starting with ASSIGNMENT= and replaces the entire line
sed -i "s/^ASSIGNMENT=.*/ASSIGNMENT=\"$assignment_name\"/" "$config_file"

# Check if sed was successful
if [ $? -eq 0 ]; then
    echo ""
    echo "✓ Assignment updated successfully to: $assignment_name"
    echo "✓ Updated in: $config_file"
    echo ""
    echo "============================================"
    echo "   Running Startup Script..."
    echo "============================================"
    echo ""
    
    # Run the startup.sh script to check submissions for the new assignment
    ./startup.sh
else
    echo "Error: Failed to update the assignment in config.env"
    exit 1
fi