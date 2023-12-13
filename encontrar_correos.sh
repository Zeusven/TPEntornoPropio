#!/bin/bash

if [ "$#" -eq 0 ]; then
    echo "Uso: $0 <archivo>"
    exit 1
fi

archivo=$1

# Usamos egrep con una expresión regular para encontrar direcciones de correo electrónico
direcciones=$(egrep -o -i '\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]+\b' "$archivo")

# Imprimir las direcciones encontradas
if [ -z "$direcciones" ]; then
    echo "No se encontraron direcciones de correo electrónico en el archivo."
else
    echo "Direcciones de correo electrónico encontradas:"
    echo "$direcciones"
fi
