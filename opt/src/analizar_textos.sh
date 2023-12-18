#!/bin/bash

while true; do
    echo "Seleccione una opción:"
    echo "1. Analizar textos"
    echo "2. Salir"

    read opcion

    case $opcion in
        1)
            echo "Menú de análisis de textos:"
            echo "Ingrese el nombre del archivo a analizar:"
            read archivo

            while true; do
                echo "Seleccione una opción:"
                echo "a. Analizar longitud de palabras"
                echo "b. Buscar palíndromos"
                echo "c. Buscar direcciones de correo"
                echo "d. Volver al menú principal"

                read opcion_analisis

                case $opcion_analisis in
                    a)
                        echo "Analizando longitud de palabras..."
                        /app/long_palabras.sh "$archivo"
                        ;;
                    b)
                        echo "Buscando palíndromos..."
                        /app/palindromo.sh "$archivo"
                        ;;
                    c)
                        echo "Buscando direcciones de correo..."
                        /app/encontrar_correos.sh "$archivo"
                        ;;
                    d)
                        echo "Volviendo al menú principal."
                        break
                        ;;
                    *)
                        echo "Opción no válida. Inténtelo de nuevo."
                        ;;
                esac
            done
            ;;
        2)
            echo "Saliendo del menú."
            exit 0
            ;;
        *)
            echo "Opción no válida. Inténtelo de nuevo."
            ;;
    esac
done

