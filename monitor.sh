#!/bin/bash

# Obtener información del sistema
CPU_USO=$(top -b -n 1 | grep "Cpu(s)" | awk '{print $2}' | awk -F. '{print $1}')
RAM_USO=$(free -m | awk '/Mem:/ {print $3}')
PROCESOS=$(ps aux --no-heading | wc -l)
DISK_USO=$(df -h / | awk '$NF=="/"{print $5}')
ESPACIO_LIBRE=$(df -h / | awk '$NF=="/"{print $4}')

# Crear un informe
REPORT="Uso de CPU: $CPU_USO%\n Uso de RAM: $RAM_USO MB\nProcesos: $PROCESOS\n Uso de DICO: $DISK_USO\n Espacio libre: $ESPACIO_LIBRE"

# Mostrar el informe en pantalla
echo -e "Monitoreando el sistema...\n$REPORT"

# Guardar el informe en un archivo
echo -e "$REPORT" > /home/Escritorio/DockerTP/outputs/report_$(date '+%d_%m_%Y:%H_%M_%S').txt

echo "Informe creado. Finalizando el script."
