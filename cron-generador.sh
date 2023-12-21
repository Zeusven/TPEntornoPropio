#!/bin/bash

OPCION=$((RANDOM % 3))
mkdir -p outputs

if [ $OPCION -eq 0 ]; then
        echo "Generando texto" > texto.txt
        HASH=$(md5sum texto.txt | cut -d ' ' -f1)
        mv texto.txt outputs/$HASH.txt
elif [ $OPCION -eq 1 ]; then
        echo "Generando audio" > audio.wav
        HASH=$(md5sum audio.wav | cut -d ' ' -f1)
        mv audio.wav outputs/$HASH.wav
elif [ $OPCION -eq 2 ]; then
        echo "Generando imagen" > imagen.jpg
        HASH=$(md5sum imagen.jpg | cut -d ' ' -f1)
        mv imagen.jpg outputs/$HASH.jpg
else
        echo "Opción inválida: $OPCION"
fi

echo "Archivo generado y movido correctamente."
