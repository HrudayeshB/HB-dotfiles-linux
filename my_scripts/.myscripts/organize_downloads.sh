#!/bin/bash

# Define the Downloads folder
DOWNLOADS_DIR="$HOME/Downloads"

# Define target folders
IMAGES_DIR="$DOWNLOADS_DIR/Images"
DOCUMENTS_DIR="$DOWNLOADS_DIR/Documents"
VIDEOS_DIR="$DOWNLOADS_DIR/Videos"
ZIP_DIR="$DOWNLOADS_DIR/Zip_Files"
DEB_DIR="$DOWNLOADS_DIR/Deb_Files"
OTHER_DIR="$DOWNLOADS_DIR/Others"

# Create folders if they don't exist
mkdir -p "$IMAGES_DIR" "$DOCUMENTS_DIR" "$VIDEOS_DIR" "$ZIP_DIR" "$DEB_DIR" "$OTHER_DIR"

# Function to move files
move_file() {
    case "$1" in
        *.jpg|*.jpeg|*.png|*.gif|*.bmp|*.svg)
            mv "$1" "$IMAGES_DIR/"
            ;;
        *.pdf|*.doc|*.docx|*.txt|*.xls|*.xlsx|*.ppt|*.pptx)
            mv "$1" "$DOCUMENTS_DIR/"
            ;;
        *.mp4|*.mkv|*.avi|*.mov|*.webm)
            mv "$1" "$VIDEOS_DIR/"
            ;;
        *.zip|*.tar|*.gz|*.rar|*.tar.xz)
            mv "$1" "$ZIP_DIR/"
            ;;
        *.deb)
            mv "$1" "$DEB_DIR/"
            ;;
        *)
            mv "$1" "$OTHER_DIR/"
            ;;
    esac
}

# Iterate through files in the Downloads folder
for FILE in "$DOWNLOADS_DIR"/*; do
    if [ -f "$FILE" ]; then
        move_file "$FILE"
    fi
done

echo "Files have been organized!"
