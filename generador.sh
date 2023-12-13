while true; do
    # Generar archivo de texto
    base64 /dev/urandom | head -c 500 > outputs/texto_$(date '+%s').txt

    # Generar archivo de sonido
    #/usr/bin/ffmpeg -f lavfi -i "anoisesrc=a=0.1:c=white:duration=5" -c:a pcm_s16le -y "/app/outputs/sonido_$(date '+%s').wav"

    # Generar archivo de imagen
    /usr/bin/convert -size 100x100 xc: +noise Random outputs/imagen_$(date '+%s').png

    # Esperar 1 minuto antes de generar el siguiente archivo
	sleep 60
done
