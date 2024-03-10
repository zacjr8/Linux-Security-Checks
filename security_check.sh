#!/bin/bash

# Title: Linux Security Check Script
# Description: Performs basic security checks on a Linux Ubuntu machine
# Author: Your Name
# Date: [Date]

# Function to check if the script is running with root privileges
check_root() {
    if [[ $EUID -ne 0 ]]; then
        echo "This script must be run as root" 
        exit 1
    fi
}

# Function to check for software updates
check_updates() {
    echo "Checking for available updates..."
    apt update
    apt list --upgradable
}

# Function to check for open ports
check_open_ports() {
    echo "Checking for open ports..."
    netstat -tuln
}

# Function to check for users with sudo privileges
check_sudo_users() {
    echo "Checking for users with sudo privileges..."
    grep -Po '^sudo.+:\K.*$' /etc/group
}

# Function to check for unnecessary services
check_unnecessary_services() {
    echo "Checking for unnecessary services..."
    systemctl list-unit-files | grep enabled
}

# Main function
main() {
    check_root
    check_updates
    check_open_ports
    check_sudo_users
    check_unnecessary_services
}

# Execute the main function
main
