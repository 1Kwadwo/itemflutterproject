#!/usr/bin/env bash
set -e

echo "Starting Flutter build process..."

# Install Flutter
echo "Installing Flutter..."
git clone https://github.com/flutter/flutter.git -b stable --depth 1
export PATH="$PATH:`pwd`/flutter/bin"

# Verify Flutter installation
echo "Verifying Flutter installation..."
flutter --version

# Enable Flutter web
echo "Configuring Flutter for web..."
flutter config --enable-web

# Get dependencies
echo "Getting Flutter dependencies..."
flutter pub get

# Build for web
echo "Building Flutter web app..."
flutter build web --release

echo "Build completed successfully!"
