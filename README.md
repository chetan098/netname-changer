# Permanent LAN Card Renamer (Linux)

This project allows you to **permanently change the name of a LAN (network) adapter** in Linux-based systems such as **Kali Linux**, **Linux Mint**, and other distros using `systemd`.  
The script will prompt the user to select the adapter they want to rename and set a new name that remains the same even after a system restart.

---

## Features
- Works on any Linux distribution using `systemd` (tested on Kali Linux and Mint OS).
- Interactive prompts for selecting the adapter and setting a new name.
- Automatically updates **udev rules** for persistent naming.
- Simple and beginner-friendly bash script.

---

## How It Works
Linux assigns network interface names dynamically on boot.  
This script:
1. Lists available network interfaces.
2. Prompts the user for the old name (e.g., `eth0`, `enp3s0`) and the new desired name (e.g., `lan0`).
3. Creates a persistent **udev rule** in `/etc/udev/rules.d/`.
4. Reloads udev rules so the change takes effect after a reboot.

---

## Installation & Usage

### 1. Clone the Repository
```bash
git clone https://github.com/YOUR_USERNAME/lan-card-renamer.git
cd lan-card-renamer
```

### 2. Setup and usage 
```bash
chmod +x rename_nic.sh
sudo ./rename_nic.sh
```
