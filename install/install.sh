#!/bin/bash

APP_NAME="brlogs"
TARGET_SCRIPT="$(pwd)/brainlogs/main.py"

echo "# Adding alias '$APP_NAME'..."
echo "alias $APP_NAME='python3 \"$TARGET_SCRIPT\"'" >> ~/.bashrc
echo "Added to .bashrc. Run 'source ~/.bashrc' or restart your terminal."
