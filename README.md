# macOS Cleaner App

A sleek, portable macOS application that automates system cleanup via a simple double-click.

## Features

- **ML Cache Cleaning**: Removes caches from `~/.cache`, `~/.keras`, etc.
- **System Cleanup**: Clears `~/Library/Caches`.
- **App Junk Removal**: Cleans logs and temporary data from Application Support (VS Code, Cursor, Telegram, etc.).
- **Package Manager Pruning**: Prunes `pnpm` store and cleans `brew`.
- **Native Experience**: Runs as a standard `.app` and opens in Terminal for visibility.

## Installation & Usage

1.  **Clone the repository**:
    ```bash
    git clone https://github.com/ayushmaninbox/cleaner.git
    cd cleaner
    ```
2.  **Ensure Permissions**:
    The repo comes with pre-set permissions, but if you have issues:
    ```bash
    chmod +x Cleaner.app/Contents/MacOS/launcher
    chmod +x Cleaner.app/Contents/Resources/clean_storage.sh
    ```
3.  **Run**:
    Simply double-click **Cleaner.app** in Finder.

## Customization

You can modify the cleanup logic by editing the script inside the app bundle:
`Cleaner.app/Contents/Resources/clean_storage.sh`

## Disclaimer
This script removes cache files. While generally safe, use at your own risk. It specifically targets developer tools and common macOS caches.
