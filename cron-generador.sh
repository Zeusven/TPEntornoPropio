#!/bin/bash

# Generar archivo de texto
base64 /dev/urandom | head -c 500 > outputs/texto_$contador.txt

# Generar archivo de sonido
ffmpeg -f lavfi -i "sine=frequency=1000:duration=5" -c:a pcm_s16le -y "outputs/sonido_$contador.wav"

# Generar archivo de imagen
convert -size 100x100 xc: +noise Random "outputs/imagen_$contador.png"

echo "Archivo $contador generado."






if [ "$respuesta" == "Sí" ] || [ "$respuesta" == "sí" ]; then
    echo "Generando 20 archivos adicionales..."
    # Reiniciar el contador
    contador=21

    while [ $contador -le 40 ]; do
        # Generar archivo de texto
        base64 /dev/urandom | head -c 500 > outputs/texto_$contador.txt

        # Generar archivo de sonido
        ffmpeg -f lavfi -i "anoisesrc=a=0.1:c=white:duration=5" -c:a pcm_s16le -y "outputs/sonido_$contador.wav"

        # Generar archivo de imagen
        convert -size 100x100 xc: +noise Random "outputs/imagen_$contador.png"

        echo "Archivo $contador generado."

        # Incrementar el contador
        ((contador++))

        # Esperar 1 minuto antes de generar el siguiente archivo
        sleep 60
    done

    echo "Generación de archivos completada."
else
    echo "Generación de archivos completada."
fi

