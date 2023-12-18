#!/bin/bash

# Mueve al directorio los archivos para clasificar
cd /app/outputs

# Recorre cada archivo
for file in *; do
    # Use the 'file' command to determine the file type
    file_type=$(file -b --mime-type "$file")

    # Mueve el archivo a la carpeta apropiada según su tipo
    case "$file_type" in
        image*) mv "$file" /home/Escritorio/DockerTP/outputs/img/ ;;
        audio*) mv "$file" /home/Escritorio/DockerTP/outputs/snd/ ;;
        text*)  mv "$file" /home/Escritorio/DockerTP/outputs/txt/ ;;
        *)      echo "Unknown file type: $file_type" ;;
    esac
done

echo "Clasificación completa."
