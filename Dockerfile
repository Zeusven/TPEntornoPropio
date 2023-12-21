# Utiliza una imagen base oficial de Ubuntu como imagen padre
FROM ubuntu:latest

# Instala paquetes necesarios
RUN apt-get update && \
    apt-get install -y cron imagemagick ffmpeg procps

# Crea un directorio para almacenar archivos generados
RUN mkdir -p /app/outputs

# Copia el script generador.sh al contenedor
COPY generador.sh /app/

# Copia el archivo crontab dentro del contenedor
COPY ./etc/crontab /etc/cron.d/generador-cron

# Establece permisos y aplica la tarea programada del cron
RUN chmod 0644 /etc/cron.d/generador-cron && \
    crontab /etc/cron.d/generador-cron

# Ejecuta el cron y mantiene el contenedor en ejecucion
CMD cron -f


