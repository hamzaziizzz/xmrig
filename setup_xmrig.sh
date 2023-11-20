#!/bin/bash
# This script installs dependencies and sets up XMRig for Monero mining on a Jetson Nano.

# Update package list
echo "Updating package list..."
sudo apt update
echo

# Upgrade installed packages
echo "Upgrading installed packages..."
sudo apt upgrade -y
echo

# Install necessary dependencies
echo "Installing dependencies..."
sudo apt install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev -y
echo

# Install additional package for SSL documentation
echo "Installing SSL documentation package..."
sudo apt install libssl-doc -y
echo

# Clone XMRig repository
echo "Cloning XMRig repository..."
git clone https://github.com/xmrig/xmrig.git Monero-Crypto-Mining
echo

# Navigate to XMRig directory
echo "Entering XMRig directory..."
cd Monero-Crypto-Mining/
echo

# Create a build directory
echo "Creating build directory..."
mkdir build
echo

# Enter the build directory
echo "Entering build directory..."
cd build/
echo

# Configure the build with CMake
echo "Configuring the build with CMake..."
cmake ..
echo

# Build XMRig with 4 parallel jobs
echo "Building XMRig with 4 parallel jobs..."
make -j4
echo

# Run XMRig with mining parameters
echo "Running XMRig with mining parameters..."
./xmrig -o gulf.moneroocean.stream:10128 -u 48B3K2QCL4YCa667f4ASW4RGmzvppBRuPCy7kzPTUyknD1ERtMfetuoT1WFj1PCJ1s5P8wPAH8N9pJcRHyHt1Liu6YzRM7r -p office-ubutnu
