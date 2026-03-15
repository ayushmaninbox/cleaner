#!/bin/bash

echo "🚀 Starting comprehensive cleanup..."

# 1. Safety First: User-requested Exclusions (Spotify & Comet)
echo "🛡️ Preserving Spotify and Comet data..."
# Brave is no longer excluded as per user request.
# Comet is now strictly protected.

# 2. System Caches (with Exclusions)
echo "🧹 Cleaning System Caches (excluding Spotify & Comet)..."
if [ -d "$HOME/Library/Caches" ]; then
    # Delete everything in ~/Library/Caches EXCEPT Spotify and Comet
    find "$HOME/Library/Caches" -mindepth 1 -maxdepth 1 ! -name "*spotify*" ! -name "*Comet*" -exec rm -rf {} +
fi

# 3. Developer Tools (The BIG storage hogs)
echo "💻 Cleaning Developer junk..."
# Xcode
XCODE_DIR="$HOME/Library/Developer/Xcode"
if [ -d "$XCODE_DIR" ]; then
    echo "   - Cleaning Xcode DerivedData, Archives, and DeviceSupport..."
    rm -rf "$XCODE_DIR/DerivedData"/*
    rm -rf "$XCODE_DIR/Archives"/*
    rm -rf "$XCODE_DIR/iOS DeviceSupport"/*
fi
# CoreSimulator
rm -rf ~/Library/Developer/CoreSimulator/Devices/*/data/Library/Caches/*

# 4. App Specific Junk
echo "📱 Cleaning App-specific caches..."
# Roblox
rm -rf ~/Library/Caches/com.roblox.RobloxPlayer
# VN Video Editor
rm -rf ~/Library/Containers/com.frontrow.vlognow.mac/Data/Library/Caches/*
# Logic Pro
rm -rf ~/Library/Caches/com.apple.logic10
# Rekordbox
rm -rf ~/Library/Caches/com.pioneerdj.rekordbox

# 5. System Logs & Junk
echo "🪵 Cleaning System Logs and temporary files..."
rm -rf ~/Library/Logs/*
sudo rm -rf /Library/Logs/*
sudo rm -rf /private/var/log/*
sudo rm -rf /private/var/folders/*

# 6. Other Common Areas
echo "🗑️ Cleaning Trash and Mail downloads..."
rm -rf ~/.Trash/*
rm -rf ~/Library/Containers/com.apple.mail/Data/Library/Mail\ Downloads/*
rm -rf ~/Library/Caches/com.apple.QuickLookDaemon.Cache

# 7. ML & Python
echo "🤖 Cleaning ML and Python caches..."
rm -rf ~/.cache
rm -rf ~/.keras
rm -rf ~/Library/Python

# 8. Package Managers & Build Tools
echo "📦 Pruning Package Manager caches..."
if command -v npm &> /dev/null; then
    echo "   - npm cache clean..."
    npm cache clean --force
fi

if command -v yarn &> /dev/null; then
    echo "   - yarn cache clean..."
    yarn cache clean
fi

if command -v pnpm &> /dev/null; then
    echo "   - pnpm store prune..."
    pnpm store prune
fi

if command -v brew &> /dev/null; then
    echo "   - Homebrew cleanup..."
    brew cleanup -s
    rm -rf "$(brew --cache)"
fi

# 9. Docker (Safe Prune)
if command -v docker &> /dev/null; then
    echo "🐳 Pruning unused Docker data..."
    docker system prune -f --volumes
fi

echo "✨ Cleanup complete! Some files may require a restart to be fully cleared."
