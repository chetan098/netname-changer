#!/bin/bash

echo "=== Persistent NIC Renamer ==="

# List interfaces
echo "Available network interfaces:"
ip -o link show | awk -F': ' '{print $2}'

# Ask for old and new name
read -p "Enter the current interface name: " OLD_NAME
read -p "Enter the new interface name: " NEW_NAME

# Validate input
if [[ -z "$OLD_NAME" || -z "$NEW_NAME" ]]; then
    echo "❌ Both current and new names are required!"
    exit 1
fi

# Get MAC address
MAC_ADDR=$(ip link show "$OLD_NAME" | awk '/link\/ether/ {print $2}')

if [[ -z "$MAC_ADDR" ]]; then
    echo "❌ Could not retrieve MAC address for $OLD_NAME. Check the interface name."
    exit 1
fi

# Create udev rule
RULE_FILE="/etc/udev/rules.d/10-persistent-net.rules"
echo "SUBSYSTEM==\"net\", ACTION==\"add\", ATTR{address}==\"$MAC_ADDR\", NAME=\"$NEW_NAME\"" | sudo tee "$RULE_FILE" > /dev/null

# Reload udev rules
sudo udevadm control --reload
sudo udevadm trigger

echo "✅ NIC rename rule created successfully!"
echo "💡 Please reboot your system to apply changes."
