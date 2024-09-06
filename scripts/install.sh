#!/bin/bash
set -e

echo "Updating package lists..."
sudo apt-get update || { echo "Failed to update package lists"; exit 1; }

echo "Installing Nginx..."
sudo apt-get install -y nginx || { echo "Failed to install Nginx"; exit 1; }

echo "Nginx installation completed successfully."
