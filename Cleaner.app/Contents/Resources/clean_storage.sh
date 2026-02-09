#!/bin/bash

echo "🚀 Starting cleanup..."

# ML Caches
echo "🧹 Cleaning ML caches..."
rm -rf ~/.cache
rm -rf ~/.keras

# System Caches
echo "🧹 Cleaning System Caches..."
rm -rf ~/Library/Caches/*

# Application Support - Caches/Large Data
echo "🧹 Cleaning Application Support junk..."
# Wallpapers/Screensavers
rm -rf ~/Library/Application\ Support/com.apple.wallpaper
# IDE Caches
rm -rf ~/Library/Application\ Support/Code
rm -rf ~/Library/Application\ Support/Cursor
# Browser Caches
rm -rf ~/Library/Application\ Support/Google
# Note: Skipping Brave and Spotify as requested to preserve cache/data
rm -rf ~/Library/Application\ Support/Telegram
# Minecraft Removal (as requested: "completely remove it")
rm -rf ~/Library/Application\ Support/minecraft
rm -rf ~/Library/Application\ Support/tlauncher
# Python Library Cleaning 
# Note: This will remove globally installed pip packages.
rm -rf ~/Library/Python

# Package Managers
if command -v pnpm &> /dev/null; then
    echo "🧹 Pruning pnpm store..."
    pnpm store prune
fi

if command -v brew &> /dev/null; then
    echo "🧹 Cleaning Homebrew..."
    brew cleanup
    brew autoremove
fi

echo "✨ Cleanup complete! Please restart your Mac for best results."
