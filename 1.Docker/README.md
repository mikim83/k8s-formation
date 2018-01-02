# 1.Docker

## 1.1.Conceptos básicos

## 1.2.Arrancar tu primer contenedor

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
## 1.3.Crea tu primer contenedor
Para crear nuestro primer contenedor necesitamos crear un fichero con el siguiente nombre: **Dockerfile** y dentro añadiremos las siguientes lineas:

```
FROM alpine:3.7
MAINTAINER Miki Monguilod, mmonguilod@oneboxtm.com
CMD while true; do echo "Congrats! your first container is running" && sleep 1 ; done
```
Una vez tengamos el fichero, necesitamos contruir la imagen:

```sh
$ docker build . -t testimage:1.0
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
Successfully tagged testimage:1.0
```
Ahora ya podemos arancar un contenedor usando la nueva imagen
```sh
$ docker run -ti testimage:1.0
Congrats! your first container is running
```
### build
Indicamos que queremos construir una imagen
### .
Indicamos donde se encuentra el fichero Dockerfile. En nuestro ejemplo, en el mismo directorio donde estamos ejecutando el comando
### -t testimage:1.0
Idicamos un el nombre que le queremos dar a la imagen. En nuestro ejemplo se crea la imagen en el repositorio local con el nombre testimage y el tag 1.0
## 1.4.Opciones mas usadas de docker
### docker ps
Mostramos los contenedores en funcionamiento
```
$ docker ps
CONTAINER ID        IMAGE                   COMMAND                  CREATED                  STATUS              PORTS               NAMES
b815687e3738        oneboxtm/firstrun:1.0   "/bin/sh -c /entry..."   Less than a second ago   Up 4 seconds                            loving_snyder
```
Si ademas queremos ver los contenedores parados o con fallos, podemos añadir la opcion ***-a***
```
docker ps -a
CONTAINER ID        IMAGE                   COMMAND                  CREATED             STATUS                           PORTS               NAMES
b815687e3738        oneboxtm/firstrun:1.0   "/bin/sh -c /entry..."   52 seconds ago      Up About a minute                                    loving_snyder
6369c93a65c8        test                    "/bin/sh -c 'while..."   About an hour ago   Exited (130) About an hour ago                       thirsty_knuth
15264a742173        oneboxtm/firstrun:1.0   "/bin/sh -c /entry..."   11 days ago         Exited (130) 11 days ago                             vibrant_roentgen
```
### docker start/stop/kill
Estas opciones nos permiten arrancar, parar o matar contenedores ya creados.
```sh
$ docker ps -a
CONTAINER ID        IMAGE                   COMMAND                  CREATED             STATUS              PORTS               NAMES
15264a742173        oneboxtm/firstrun:1.0   "/bin/sh -c /entry..."   11 days ago         Up 32 minutes                           vibrant_roentgen
$ docker stop 15264a742173
15264a742173
docker ps -a
CONTAINER ID        IMAGE                   COMMAND                  CREATED             STATUS                       PORTS               NAMES
15264a742173        oneboxtm/firstrun:1.0   "/bin/sh -c /entry..."   11 days ago         Exited (137) 2 seconds ago                       vibrant_roentgen
$ docker start 15264a742173
15264a742173
$ docker ps -a
CONTAINER ID        IMAGE                   COMMAND                  CREATED             STATUS              PORTS               NAMES
15264a742173        oneboxtm/firstrun:1.0   "/bin/sh -c /entry..."   11 days ago         Up 11 seconds                           vibrant_roentgen
```



## 1.5.Red en docker

## 1.6.Enlazar contenedores

## 1.7.Arrancar un contenedor con volumen persistente

## 1.8.Wordpress + mysql

## 1.9.Docker-compose
