#!/bin/bash

SOURCE_DIR=$1
BACKUP_DIR=$2

if [ -z "$SOURCE_DIR" ] || [ -z "$BACKUP_DIR" ]; then
    echo "Usage: $0 source_directory backup_directory"
    exit 1
fi

if [ ! -d "$SOURCE_DIR" ]; then
    echo "Source directory does not exist."
    exit 1
fi

mkdir -p "$BACKUP_DIR"
echo "Backing up files from $SOURCE_DIR to $BACKUP_DIR..."

for file in "$SOURCE_DIR"/*; do
    if [ -f "$file" ]; then
        cp "$file" "$BACKUP_DIR"
        echo "Copied: $file"
    fi
done

echo "Backup complete."
