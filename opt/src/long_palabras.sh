#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Uso: $0 <archivo_de_texto>"
    exit 1
fi

awk '
{
    for(i=1; i<=NF; i++) {
        gsub(/[^a-zA-Z]/, "", $i) # Elimina caracteres no alfabéticos
        if(length($i) > 0) {
            palabra = $i
            len = length(palabra)
            print palabra": "len" caracteres"
            total_length += len
            count++
            if (len < min_length || min_length == 0) min_length = len
            if (len > max_length) max_length = len
        }
    }
}

END {
    # Estadísticas finales
    if (count > 0) {
        promedio = total_length / count
        print "Estadísticas de longitud:"
        print "Longitud mínima: "min_length" caracteres"
        print "Longitud máxima: "max_length" caracteres"
        printf "Longitud promedio: %.2f caracteres\n", promedio
    } else {
        print "No se encontraron palabras en el texto."
    }
}' "/app/textos/$1"

