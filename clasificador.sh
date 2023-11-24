#!/bin/bash

# Move to the directory with files to classify
cd /app/outputs

# Loop through each file
for file in *; do
    # Use the 'file' command to determine the file type
    file_type=$(file -b --mime-type "$file")

    # Move the file to the appropriate folder based on its type
    case "$file_type" in
        image*) mv "$file" /app/outputs/img/ ;;
        audio*) mv "$file" /app/outputs/snd/ ;;
        text*)  mv "$file" /app/outputs/txt/ ;;
        *)      echo "Unknown file type: $file_type" ;;
    esac
done

echo "Clasificación completa."
