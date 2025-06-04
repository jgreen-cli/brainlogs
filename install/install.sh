#!/bin/bash

APP_NAME="brlogs"
SCRIPT_PATH="$(realpath "$(dirname "$0")/../run.sh")"
SYMLINK_PATH="/usr/local/bin/$APP_NAME"
USER_DATA_DIR="$HOME/.brainlogs"

if [[ "$1" == "uninstall" ]]; then
    echo "This will remove the shortcut command '$APP_NAME' from $SYMLINK_PATH."
    read -p "Are you sure you want to uninstall? (y/n): " yn
    case $yn in
        [Yy]*)
            if [ -L "$SYMLINK_PATH" ]; then
                echo "Removing symlink at $SYMLINK_PATH..."
                sudo rm "$SYMLINK_PATH"
                echo "Uninstall complete. Shortcut removed."
            else
                echo "No symlink found at $SYMLINK_PATH. Nothing to remove."
            fi
            ;;
        *)
            echo "Aborted. No changes made."
            exit 0
            ;;
    esac
    exit 0
fi

if [[ "$1" == "purge" ]]; then
    echo "This will remove the shortcut command '$APP_NAME' from $SYMLINK_PATH and delete all user data at $USER_DATA_DIR."
    echo "Paths to be removed:"
    echo "  Symlink: $SYMLINK_PATH"
    echo "  User data directory: $USER_DATA_DIR"
    read -p "Are you sure you want to fully uninstall and delete all data? (y/n): " yn
    case $yn in
        [Yy]*)
            if [ -L "$SYMLINK_PATH" ]; then
                echo "Removing symlink at $SYMLINK_PATH..."
                sudo rm "$SYMLINK_PATH"
                echo "Symlink removed."
            else
                echo "No symlink found at $SYMLINK_PATH. Nothing to remove."
            fi
            if [ -d "$USER_DATA_DIR" ]; then
                echo "Removing user data directory at $USER_DATA_DIR..."
                rm -rf "$USER_DATA_DIR"
                echo "User data directory removed."
            else
                echo "No user data directory found at $USER_DATA_DIR. Nothing to remove."
            fi
            echo "Full uninstall complete."
            ;;
        *)
            echo "Aborted. No changes made."
            exit 0
            ;;
    esac
    exit 0
fi

echo "Preparing to add a shortcut command '$APP_NAME' to $SYMLINK_PATH."
echo "Target script: $SCRIPT_PATH"
read -p "Do you want to continue? (y/n): " yn
case $yn in
    [Yy]* ) 
        echo "Linking $APP_NAME to $SYMLINK_PATH..."
        sudo ln -sf "$SCRIPT_PATH" "$SYMLINK_PATH"
        if [ $? -eq 0 ]; then
            echo "Done. You can now run '$APP_NAME' from anywhere."
        else
            echo "Failed to create symlink. Please check permissions."
        fi
        ;;
    * ) 
        echo "Aborted. No changes made."
        exit 0
        ;;
esac