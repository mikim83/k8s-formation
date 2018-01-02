# Docker

## Conceptos básicos

## Arrancar tu primer contenedor

La forma mas simple de arrancar un contendor y ver la salida por consola es la siguiente:

```sh
$ docker run -ti oneboxtm/firstrun:1.0
```
### run
Indicamos que queremos arrancar un contenedor de docker desde 0
### -ti
Arrancamos el contenedor con un terminal interactivo
### oneboxtm/firstrun:1.0
Es el repositorio/imagen:tag . Si se pone de esta forma, por defecto el demonio de docker ira a buscar al imagen a los repositorios de docker hub. Sino tendriamos que indicarle la url de nuestro repositorio privado (p.e. mirepo.ejemplo.com/firtsrun:1.0)
## Crea tu primer contenedor
Para crear nuestro primer contenedor necesitamos crear un fichero con el siguiente nombre: **Dockerfile** y dentro añadiremos las siguientes lineas:

```
FROM alpine:3.7
MAINTAINER Miki Monguilod, mmonguilod@oneboxtm.com
CMD while true; do echo "Congrats! your first container is running" && sleep 1 ; done
```
Una vez tengamos el fichero, necesitamos contruir la imagen:

```sh
$ docker build . -t testimage
Sending build context to Docker daemon  9.728kB
Step 1/3 : FROM alpine:3.7
 ---> e21c333399e0
Step 2/3 : MAINTAINER Miki Monguilod, mmonguilod@oneboxtm.com
 ---> Using cache
 ---> 8d7caaec083f
Step 3/3 : CMD while true; do echo "Congrats! your first container is running" && sleep 1 ; done
 ---> Using cache
 ---> cd13c4bf19fd
Successfully built cd13c4bf19fd
Successfully tagged testimage:latest
```
Ahora ya podemos arancar un contenedor usando la nueva imagen
```sh
$ docker run -ti testimage
Congrats! your first container is running
```


## Opciones mas usadas

## Red en docker

## Enlazar contenedores

## Arrancar un contenedor con volumen persistente

## Wordpress + mysql

## Docker-compose
