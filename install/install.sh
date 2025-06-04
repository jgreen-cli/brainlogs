#!/bin/bash

APP_NAME="brlogs"
WRAPPER="$(pwd)/run.sh"

echo "Linking $APP_NAME to /usr/local/bin..."
sudo ln -sf "$WRAPPER" "/usr/local/bin/$APP_NAME"
echo "Done. You can now run '$APP_NAME' from anywhere."
