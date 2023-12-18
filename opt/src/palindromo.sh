#!/bin/bash

if [ "$#" -eq 0 ]; then
    echo "Uso: $0 <archivo>"
    exit 1
fi

archivo=/app/textos/$1

# Leer el contenido del archivo proporcionado
texto=$(cat "$archivo")

# Función para verificar si una palabra es un palíndromo
es_palindromo() {
    cadena=$1
    # Lógica para verificar si la cadena es un palíndromo
    [ "${#cadena}" -gt 1 ] && [ "$cadena" = "$(echo "$cadena" | rev)" ]
}

# Filtrar palabras palíndromas y mostrarlas
palindromos=$(echo "$texto" | tr -s '[:space:]' '\n' | grep -o '\b\w*\b' | while read -r palabra; do
    if es_palindromo "$palabra"; then
        echo "$palabra"
    fi
done)

# Mostrar las palabras palíndromas encontradas
if [ -z "$palindromos" ]; then
    echo "No se encontraron palabras palíndromas en el texto."
else
    echo "Palabras palíndromas encontradas:"
    echo "$palindromos"
fi

