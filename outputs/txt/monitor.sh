#!/bin/bash

# Líneas de depuración
echo "Monitoreando el sistema..."

# Obtener información del sistema
CPU_USO=$(top -b -n 1 | grep "Cpu(s)" | awk '{print $2}' | awk -F. '{print $1}')
RAM_USO=$(free -m | awk '/Mem:/ {print $3}')
PROCESOS=$(ps aux --no-heading | wc -l)
DISK_USO=$(df -h | awk '$NF=="/"{print $5}')

# Líneas de depuración
echo "Información del sistema obtenida."

# Crear un informe
REPORT="Uso de CPU: $CPU_USO%\n Uso de RAM: $RAM_USO MB\nProcesos: $PROCESOS\n Uso de DICO: $DISK_USO"

# Líneas de depuración
echo "Creando informe..."

# Guardar el informe en un archivo
echo -e "$REPORT" > /home/Escritorio/DockerTP/outputs/report_$(date '+%d_%m_%Y:%H_%M_%S').txt

# Líneas de depuración
echo "Informe creado. Finalizando el script."

