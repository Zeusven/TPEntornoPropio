#!/bin/bash

while true; do
    echo "Seleccione una opción:"
    echo "1. Clasificar archivos"
    echo "2. Monitorear el sistema"
    echo "3. Analizar textos"
    echo "4. Salir"

    read opcion

    case $opcion in
        1)
            echo "Ingrese el nombre del archivo a procesar:"
            read archivo
            /app/clasificador.sh "$archivo"
            ;;
        2)
            echo "Monitoreando el sistema..."
            /app/monitor.sh
            ;;
        3)
            echo "Analizando textos..."
            /app/analizar_textos.sh
            ;;
        4)
            echo "Saliendo del menú."
            exit 0
            ;;
        *)
            echo "Opción no válida. Inténtelo de nuevo."
            ;;
    esac
done
