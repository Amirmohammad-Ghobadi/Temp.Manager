#!/bin/bash

# Constants (uppercase)
TEMP_FOLDER_NAME="temp_maker_storage"
TEMP_FILE_NAME="temps.log"
CLEANUP_ALLOWED="NO"  # Set to YES to allow cleanup

# Get the directory of the script, not the script itself
SCRIPT_DIR=$(dirname "$(realpath "$0")")

# Create a custom temporary directory inside the script's directory
TMPDIR="$SCRIPT_DIR/$TEMP_FOLDER_NAME"
mkdir -p "$TMPDIR"

# Use process substitution to redirect output to a file in the custom directory
echo "The text that will appear in the temp file log" > >(tee "$TMPDIR/$TEMP_FILE_NAME")

# Clean up if allowed
if [ "$CLEANUP_ALLOWED" = "YES" ]; then
    rm -rf "$TMPDIR"
fi
