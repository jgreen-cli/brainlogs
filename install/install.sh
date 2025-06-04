#!/bin/bash

APP_NAME="brlogs"
SCRIPT_PATH="$(realpath "$(dirname "$0")/../run.sh")"

echo "Linking $APP_NAME to /usr/local/bin..."
sudo ln -sf "$SCRIPT_PATH" "/usr/local/bin/$APP_NAME"
echo "Done. You can now run '$APP_NAME' from anywhere."
