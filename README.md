markdown
# DockerTP

Este proyecto utiliza Docker para crear un entorno de desarrollo que incluye un generador de archivos aleatorios y un usuario que clasifica esos archivos.

## Instrucciones de Uso

1. Clona el repositorio:
   bash
   git clone https://github.com/tu-usuario/DockerTP.git
   

2. Construye y ejecuta el contenedor del generador:
   bash
   cd DockerTP
   docker build -t generador -f Dockerfile_generador .
   docker run --name generador generador
   

3. Construye y ejecuta el contenedor de usuario:
   bash
   docker build -t usuario1 -f Dockerfile_usuario .
   docker run -it -v $(pwd)/textos:/app/textos usuario1
   

4. En el contenedor de usuario, selecciona opciones del menú para clasificar archivos o realizar otras acciones.

## Estructura de Archivos

- **outputs:** Directorio donde se almacenan los archivos generados por el contenedor del generador.
- **textos:** Directorio en el host con archivos de texto para ser analizados por el usuario.

## Archivos Importantes

- **Dockerfile_generador:** Archivo de configuración para el contenedor del generador.
- **Dockerfile_usuario:** Archivo de configuración para el contenedor de usuario.

## Descripción del Proyecto

El proyecto utiliza Docker para crear dos contenedores. Uno genera archivos aleatorios de texto, audio o imagen, mientras que el otro clasifica los archivos de texto en categorías específicas.

## Colaboración

Siéntete libre de contribuir al proyecto abriendo problemas (issues) o enviando solicitudes de extracción (pull requests).

## Licencia

Este proyecto está bajo la Licencia MIT - consulta el archivo [LICENSE.md](LICENSE.md) para más detalles.


Espero que esta versión sea lo que necesitas.

