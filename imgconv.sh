#!/bin/bash

# Directory to search, default is current directory
DIR="${1:-.}"

# Find all .HEIC files
find "$DIR" -type f -iname '*.HEIC' | while read -r file; do
    # Get the filename without extension
    filename="${file%.*}"
    # Set output filename with .jpg extension
    output="${filename}.jpg"

    echo "Converting: $file -> $output"

    # Convert HEIC to JPG
    # Using heif-convert (from libheif)
    if command -v heif-convert >/dev/null 2>&1; then
        heif-convert "$file" "$output"
    # Alternatively, using ImageMagick's convert
    elif command -v convert >/dev/null 2>&1; then
        convert "$file" "$output"
    else
        echo "Error: Neither heif-convert nor convert found. Install libheif-examples or ImageMagick."
        exit 1
    fi
done

echo "Conversion complete."
