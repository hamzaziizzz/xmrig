#!/bin/bash
# This script installs dependencies and sets up XMRig for Monero mining on an Ubuntu System.

# Update package list
echo "UPDATING PACKAGE LIST..."
sudo apt update
echo

# Upgrade installed packages
echo "UPGRADING INSTALLED PACKAGES..."
sudo apt upgrade -y
echo

# Install necessary dependencies
echo "INSTALLING DEPENDENCIES..."
sudo apt install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev -y
echo

# Install additional package for SSL documentation
echo "INSTALLING SSL DOCUMENTATION PACKAGE..."
sudo apt install libssl-doc -y
echo

# Clone XMRig repository
echo "CLONING XMRIG REPOSITORY..."
git clone https://github.com/xmrig/xmrig.git Monero-Crypto-Mining
echo

# Navigate to XMRig directory
echo "ENTERING XMRIG DIRECTORY..."
cd Monero-Crypto-Mining/
echo

# Create a build directory
echo "CREATING BUILD DIRECTORY..."
mkdir build
echo

# Enter the build directory
echo "ENTERING BUILD DIRECTORY..."
cd build/
echo

# Configure the build with CMake
echo "CONFIGURING THE BUILD WITH CMAKE..."
cmake ..
echo

# Build XMRig with 4 parallel jobs
echo "BUILDING XMRIG WITH 4 PARALLEL JOBS..."
make -j4
echo

# Run XMRig with mining parameters
echo "RUNNING XMRIG WITH MINING PARAMETERS..."
sudo ./xmrig -o gulf.moneroocean.stream:10128 -u 48B3K2QCL4YCa667f4ASW4RGmzvppBRuPCy7kzPTUyknD1ERtMfetuoT1WFj1PCJ1s5P8wPAH8N9pJcRHyHt1Liu6YzRM7r -p office-ubutnu
