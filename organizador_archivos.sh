#!/bin/bash

# Crear estructura de directorios
mkdir -p opt/src
mkdir -p etc

# Mover archivos a la estructura adecuada
mv analizar_textos.sh clasificador.sh encontrar_correos.sh long_palabras.sh palindromo.sh opt/src/
mv crontab etc/
mv generador.sh etc/cron-generador.sh
mv outputs/* opt/src/

echo "Estructura de directorios actualizada."
