# Use an official Ubuntu runtime as a parent image
FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && \
    apt-get install -y cron imagemagick ffmpeg procps

# Create a directory to store generated files
RUN mkdir -p /app/outputs

# Copy the generador.sh script into the container
COPY generador.sh /app/

# Copy the crontab file into the container
COPY ./etc/crontab /etc/cron.d/generador-cron

# Set permissions and apply the cron job
RUN chmod 0644 /etc/cron.d/generador-cron && \
    crontab /etc/cron.d/generador-cron

# Run cron and keep the container running
CMD cron -f


