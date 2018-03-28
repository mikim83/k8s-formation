# 1.Docker

## 1.1 Conceptos básicos

## 1.2 Arrancar tu primer contenedor

La forma mas simple de arrancar un contendor y ver la salida por consola es la siguiente:

```ShellSession
$ docker run -ti oneboxtm/firstrun:1.0
```
### run
Indicamos que queremos arrancar un contenedor de docker desde 0
### -ti
Arrancamos el contenedor con un terminal interactivo
### oneboxtm/firstrun:1.0
Es el repositorio/imagen:tag . Si se pone de esta forma, por defecto el demonio de docker ira a buscar al imagen a los repositorios de docker hub. Sino tendriamos que indicarle la url de nuestro repositorio privado (p.e. mirepo.ejemplo.com/firtsrun:1.0)

## 1.3 Crea tu primer contenedor
Para crear nuestro primer contenedor necesitamos crear un fichero con el siguiente nombre: **Dockerfile** y dentro añadiremos las siguientes lineas:

```Dockerfile
FROM alpine:3.7
MAINTAINER Miki Monguilod, mmonguilod@oneboxtm.com
CMD while true; do echo "Congrats! your first container is running" && sleep 1 ; done
```
Una vez tengamos el fichero, necesitamos contruir la imagen:

```ShellSession
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
```ShellSession
$ docker run -ti testimage:1.0
Congrats! your first container is running
```
### build
Indicamos que queremos construir una imagen
### .
Indicamos donde se encuentra el fichero Dockerfile. En nuestro ejemplo, en el mismo directorio donde estamos ejecutando el comando
### -t testimage:1.0
Idicamos un el nombre que le queremos dar a la imagen. En nuestro ejemplo se crea la imagen en el repositorio local con el nombre testimage y el tag 1.0
## 1.4 Opciones mas usadas de docker
### Operativa con contenedores e imagenes
#### docker ps
Mostramos los contenedores en funcionamiento
```ShellSession
$ docker ps
CONTAINER ID        IMAGE                   COMMAND                  CREATED                  STATUS              PORTS               NAMES
b815687e3738        oneboxtm/firstrun:1.0   "/bin/sh -c /entry..."   Less than a second ago   Up 4 seconds                            loving_snyder
```
Si ademas queremos ver los contenedores parados o con fallos, podemos añadir la opcion ***-a***
```ShellSession
docker ps -a
CONTAINER ID        IMAGE                   COMMAND                  CREATED             STATUS                           PORTS               NAMES
b815687e3738        oneboxtm/firstrun:1.0   "/bin/sh -c /entry..."   52 seconds ago      Up About a minute                                    loving_snyder
6369c93a65c8        test                    "/bin/sh -c 'while..."   About an hour ago   Exited (130) About an hour ago                       thirsty_knuth
15264a742173        oneboxtm/firstrun:1.0   "/bin/sh -c /entry..."   11 days ago         Exited (130) 11 days ago                             vibrant_roentgen
```
#### docker start/stop/kill
Estas opciones nos permiten arrancar, parar o matar contenedores ya creados.
```ShellSession
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
#### docker images
Esta opcion nos permite ver las imagenes que tenemos almacenadas en local.
```ShellSession
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
oneboxtm/firstrun   1.0                 8cf8d286bcce        19 hours ago        9.57MB
alpine              3.7                 e21c333399e0        4 weeks ago         4.14MB
```

#### docker rm
Con esta opción podemos borrar contenedores que ya no estan funcionando (stopped o killed).
```ShellSession
$ docker ps -a
CONTAINER ID        IMAGE                   COMMAND             CREATED             STATUS                    PORTS               NAMES
788ddd86532f        oneboxtm/firstrun:1.0   "/entrypoint.sh"    19 hours ago        Exited (0) 19 hours ago                       amazing_clarke
docker rm 788ddd86532f
788ddd86532f
$ docker ps -a
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
```
Si se quieren borrar todas los contenedores este comando es muy útil:

```ShellSession
$ docker rm $(docker ps -qa)
```
#### docker rmi
Con esta opción podemos borrar imagenes que ya no usen nuestros contenedores. Para poderlas borrar correctamente se necesita que no haya ningun contenedor creado que dependa de la imagen a borrar.
```ShellSession
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
oneboxtm/firstrun   1.0                 8cf8d286bcce        19 hours ago        9.57MB
alpine              3.7                 e21c333399e0        4 weeks ago         4.14MB
$ docker rmi 8cf8d286bcce
Untagged: oneboxtm/firstrun:1.0
Deleted: sha256:8cf8d286bcceb19503207840791f0f95e6afe17c45beb1c870cd90af6fd43f53
Deleted: sha256:815bc55a0cedc69624704f9f441a20570c45ef7636c1d3215ba60932c6f616d3
Deleted: sha256:ec5910c7a635ba75580ee32019c27a9e01a766bded8cbe930b39abe286b0282e
Deleted: sha256:0dfbbaee79cac056982c08ef3d154100694b9227942fc6a4483a5510a3d11e17
Deleted: sha256:977ec93c91986ccc48bf7a3ae3e4ae0f5938f35f50d58fcc3d8706fb0a79fbe6
Deleted: sha256:0ca7d2c8f2593f896fe6c4fd30e0d51a0378f668a0861a6061b94229a1ac8a90
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
alpine              3.7                 e21c333399e0        4 weeks ago         4.14MB
```
Si se quieren borrar todas las imagenes este comando es muy útil:

```ShellSession
$ docker rmi $(docker images -qa)
```
#### docker pull/push
Con estas opciones podemos descargarnos imagenes en local o subirlas a algun repositorio remoto. Muchos de estos respositorio, como el de docker hub, antes necesitan que nos autentiquemos, para eso usaremos el comando ***docker login***
```ShellSession
$ docker pull oneboxtm/firstrun:1.0
1.0: Pulling from oneboxtm/firstrun
2fdfe1cd78c2: Pull complete
7ad7ef040bbc: Pull complete
338ec0baead8: Pull complete
Digest: sha256:f2d85e61bbb4cfccd2813d8022d2620fc0c56e398f75b4cac31cb3181507e30f
Status: Downloaded newer image for oneboxtm/firstrun:1.0
$ docker pull oneboxtm/firstrun:1.0
1.0: Pulling from oneboxtm/firstrun
2fdfe1cd78c2: Pull complete
7ad7ef040bbc: Pull complete
338ec0baead8: Pull complete
Digest: sha256:f2d85e61bbb4cfccd2813d8022d2620fc0c56e398f75b4cac31cb3181507e30f
Status: Downloaded newer image for oneboxtm/firstrun:1.0
$ docker login
Login with your Docker ID to push and pull images from Docker Hub. If you don t have a Docker ID, head over to https://hub.docker.com to create one.
Username (oneboxtm):
Password:
Login Succeeded
$ docker push oneboxtm/firstrun:1.0
The push refers to a repository [docker.io/oneboxtm/firstrun]
28ac11fa6865: Layer already exists
1d3e7309cca5: Layer already exists
04a094fe844e: Layer already exists
1.0: digest: sha256:f2d85e61bbb4cfccd2813d8022d2620fc0c56e398f75b4cac31cb3181507e30f size: 946
```

## Opciones de arranque de los contenedores

### Arrancar un contenedor definiendole un nombre
Por defecto cuando arrancamos un contenedor, Docker le pone un nombre aleataorio. Con la opción ***--name NOMBRE_CONTENEDOR*** le indicamos un nombre definido por nosotros y que luego podremos usar para referirnos a él.

```ShellSession
$ docker run -d --name firstrun oneboxtm/firstrun:1.0 
f8d66944ecd6c9dc022aad2731692c4b481036c13ce0fa790e50fb6869a808c1
$ docker ps
CONTAINER ID        IMAGE                   COMMAND             CREATED                  STATUS              PORTS               NAMES
f8d66944ecd6        oneboxtm/firstrun:1.0   "/entrypoint.sh"    Less than a second ago   Up 1 second                             firstrun
```
### Arrancar contenedor en background 
Con la opción ***-d*** podemos arrancar un contenedor en el modo *detached*, es decir, en modo background. 
```ShellSession
$ docker run -d oneboxtm/firstrun:1.0
9c199902f8c40914d3af94f51b0177e12d703539b998ccab11c06299cfb4a812
$ docker ps
CONTAINER ID        IMAGE                   COMMAND                  CREATED                  STATUS              PORTS               NAMES
9c199902f8c4        oneboxtm/firstrun:1.0   "/bin/sh -c /entry..."   Less than a second ago   Up 2 seconds                            angry_dijkstra
```
### Arrancar contenedor pasandole variables de entorno
Con la opción ***-e*** podemos pasarle una o mas variables de entorno

```ShellSession
$ docker run -ti -e TEST1_ENV=PRUEBA1 -e TEST2_ENV=PRUEBA2 oneboxtm/firstrun:1.0
#####################
ENVIRONMENT VARIABLES
no_proxy=*.local, 169.254/16
HOSTNAME=ba2c7cce5715
SHLVL=1
HOME=/root
TEST1_ENV=PRUEBA1
TEST2_ENV=PRUEBA2
TERM=xterm
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
PWD=/
#####################
Congrats! your first container is running
Congrats! your first container is running
```

### Arrancar un contenedor escuchando en uno o varios puertos
Con la opción ***-p PUERTO_LOCAL:PUERTO_CONTENEDOR*** podemos abrir puertos para poder consultar el contenedor desde fuera

```ShellSession
$ docker run -d -p 15060:5060 -e NCPORT=5060 oneboxtm/firstrun:1.0
1bae82e2fefd1fb40da6d4b76dc3789518bc2b40b864c4eceb33ed8c568d6e8d
$ telnet localhost 15060
Trying ::1...
Connected to localhost.
Escape character is '^]'.
TEST TEST TEST
^]
telnet> Connection closed.
$ docker logs 1bae82e2fefd
#####################
ENVIRONMENT VARIABLES
no_proxy=*.local, 169.254/16
NCPORT=5060
HOSTNAME=1bae82e2fefd
SHLVL=1
HOME=/root
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
PWD=/
#####################
Listening on [0.0.0.0] (family 0, port 5060)
Connection from 172.17.0.1 35076 received!
TEST TEST TEST
Netcat listening on port 5060
Congrats! your first container is running
```

### Arrancar un contenedor y que se borre automaticamente cuando lo paramos
Una opción muy util ( ***--rm*** ) es la de permitir que un contenedor se borre automaticamente cuando lo paramos o lo matamos.
```ShellSession
$ docker run -ti --rm oneboxtm/firstrun:1.0
#####################
ENVIRONMENT VARIABLES
no_proxy=*.local, 169.254/16
HOSTNAME=f111d9da20ff
SHLVL=1
HOME=/root
TERM=xterm
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
PWD=/
#####################
Congrats! your first container is running
^CSIGINT RECEIVED
$ docker ps -a
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
```

## Opciones de creación de contenedores

### Añadir un fichero o directorio a nuestra imagen
En el directorio donde se encuentre nuestro Dockerfile crearemos un fichero que añadiremos a la imagen

```sh
echo "HOLA" > fichero.txt
```
Y en el Dockerfile indicamos que lo añada

```Dockerfile
FROM alpine:3.7
MAINTAINER Miki Monguilod, mmonguilod@oneboxtm.com
COPY fichero.txt /fichero.txt
CMD while true; do cat /fichero.txt && sleep 1 ; done
```
Ahora construimos la imagen y arrancamos un contenedor
```ShellSession
$ docker build . -t testing
Sending build context to Docker daemon  3.072kB
Step 1/4 : FROM alpine:3.7
 ---> e21c333399e0
Step 2/4 : MAINTAINER Miki Monguilod, mmonguilod@oneboxtm.com
 ---> Using cache
 ---> 6ec2fabafe5b
Step 3/4 : ADD fichero.txt /fichero.txt
 ---> 0d981c44670d
Step 4/4 : CMD while true; do cat /fichero.txt && sleep 1 ; done
 ---> Running in 538cf178cdb8
 ---> 067094b62b3f
Removing intermediate container 538cf178cdb8
Successfully built 067094b62b3f
Successfully tagged testing:latest
$ docker run --rm -ti testing
HOLA
HOLA
```
También se puede usar el comando ***ADD*** , que ademas de permitir copiar un fichero local, te permite bajar automaticamente un fichero de una URL.

### Definir una variable de entorno en nuestra imagen
Podemos definir variable de entorno en nuestras imagenes. El contenido de estas variables pueden ser substituidos si se vuelven a redefinir cuando se arranca un contenedor.

Contenido del Dockerfile
```Dockerfile
FROM alpine:3.7
MAINTAINER Miki Monguilod, mmonguilod@oneboxtm.com
ENV TEST_ENV HOLA
CMD while true; do echo ${TEST_ENV} && sleep 1 ; done
```
Volvemos a construir y ejecutamos:

```ShellSession
$ docker build . -t testing
Sending build context to Docker daemon  3.072kB
Step 1/4 : FROM alpine:3.7
 ---> e21c333399e0
Step 2/4 : MAINTAINER Miki Monguilod, mmonguilod@oneboxtm.com
 ---> Using cache
 ---> 6ec2fabafe5b
Step 3/4 : ENV TEST_ENV HOLA
 ---> Running in a6fb9a06a23a
 ---> 8ca0bc972f94
Removing intermediate container a6fb9a06a23a
Step 4/4 : CMD while true; do echo ${TEST_ENV} && sleep 1 ; done
 ---> Running in 1af4f0e90b5f
 ---> 0d8c2260f464
Removing intermediate container 1af4f0e90b5f
Successfully built 0d8c2260f464
Successfully tagged testing:latest
$ docker run --rm -ti testing
HOLA
```
Ahora volvemos a ejecutar pero volviendo a definir la variable de entorno con otro valor
```ShellSession
$ docker run --rm -ti -e TEST_ENV=ADIOS testing
ADIOS
```

### Ejecutar un comando durante la creación de la imagen
Hay veces en las que nos interesa poder ejecutar un comando durante la creación de la imagen, como por ejemplo poder instalar una aplicación, descomprimir un fichero, etc...

Contenido del Dockerfile
```Dockerfile
FROM alpine:3.7
MAINTAINER Miki Monguilod, mmonguilod@oneboxtm.com
RUN touch /tmp/file_test
RUN apk update && \
    apk add openjdk8
CMD while true; do java -version && sleep 1 ; done
```

### Multi-stage containers
Esta opcion nos permite crear dos o mas contenedores de tal manera que podamos acceder a ficheros del contenedor anterior. Es decir, podemos tener un primer paso donde se cree una imagen que compila codigo y en la segunda imagen se copia el binario resultante de esa compilacion y lo ejecuta. De esta manera podemos tener imagenes que compilan y que ademas ejecutan el binario resultante.

Creamos un fichero hello.c
```C
/* Hello World program */

#include<stdio.h>

int main()
{
    printf("Hello World\n");

}
```
Y ahora creamos un fichero Dockerfile

```Dockerfile
#BUILD CONTAINER
FROM alpine:latest as builder
MAINTAINER Miki Monguilod, mmonguilod@oneboxtm.com
ADD hello.c /hello.c
RUN apk update && \
    apk add build-base
WORKDIR /
RUN gcc -o hello hello.c

#RUN CONTAINER
FROM alpine:latest
COPY --from=builder /hello .
CMD while true; do /hello && sleep 1 ; done
```

Y ahora hacemos el build de la imagen

```Shellsession
$ docker build . -t ctest
Sending build context to Docker daemon  3.072kB
Step 1/9 : FROM alpine:latest as builder
latest: Pulling from library/alpine
2fdfe1cd78c2: Pull complete
Digest: sha256:ccba511b1d6b5f1d83825a94f9d5b05528db456d9cf14a1ea1db892c939cda64
Status: Downloaded newer image for alpine:latest
 ---> e21c333399e0
Step 2/9 : MAINTAINER Miki Monguilod, mmonguilod@oneboxtm.com
 ---> Running in 3fe4a9815960
 ---> 45485947d576
Removing intermediate container 3fe4a9815960
Step 3/9 : ADD hello.c /hello.c
 ---> 6221669737e4
Step 4/9 : RUN apk update &&     apk add build-base
 ---> Running in 62860a707212
fetch http://dl-cdn.alpinelinux.org/alpine/v3.7/main/x86_64/APKINDEX.tar.gz
fetch http://dl-cdn.alpinelinux.org/alpine/v3.7/community/x86_64/APKINDEX.tar.gz
v3.7.0-50-gc8da5122a4 [http://dl-cdn.alpinelinux.org/alpine/v3.7/main]
v3.7.0-49-g06d6ae04c3 [http://dl-cdn.alpinelinux.org/alpine/v3.7/community]
OK: 9046 distinct packages available
(1/18) Installing binutils-libs (2.28-r3)
(2/18) Installing binutils (2.28-r3)
(3/18) Installing gmp (6.1.2-r1)
(4/18) Installing isl (0.18-r0)
(5/18) Installing libgomp (6.4.0-r5)
(6/18) Installing libatomic (6.4.0-r5)
(7/18) Installing pkgconf (1.3.10-r0)
(8/18) Installing libgcc (6.4.0-r5)
(9/18) Installing mpfr3 (3.1.5-r1)
(10/18) Installing mpc1 (1.0.3-r1)
(11/18) Installing libstdc++ (6.4.0-r5)
(12/18) Installing gcc (6.4.0-r5)
(13/18) Installing musl-dev (1.1.18-r2)
(14/18) Installing libc-dev (0.7.1-r0)
(15/18) Installing g++ (6.4.0-r5)
(16/18) Installing make (4.2.1-r0)
(17/18) Installing fortify-headers (0.9-r0)
(18/18) Installing build-base (0.5-r0)
Executing busybox-1.27.2-r6.trigger
OK: 159 MiB in 29 packages
 ---> 8977c8c8cd70
Removing intermediate container 62860a707212
Step 5/9 : WORKDIR /
 ---> 83f0386f72de
Removing intermediate container 79d43295c512
Step 6/9 : RUN gcc -o hello hello.c
 ---> Running in 0cdb8bd8b08b
 ---> 4075d7ab4329
Removing intermediate container 0cdb8bd8b08b
Step 7/9 : FROM alpine:latest
 ---> e21c333399e0
Step 8/9 : COPY --from=builder /hello .
 ---> 4e84a9845907
Step 9/9 : CMD while true; do /hello && sleep 1 ; done
 ---> Running in 940892307bf8
 ---> 843b8fe1b7c8
Removing intermediate container 940892307bf8
Successfully built 843b8fe1b7c8
Successfully tagged ctest:latest
```

## 1.5 Red en docker

Las ultimas versiones de docker permiten crear redes virtuales donde correran nuestros contenedores.
De esta manera se puede asignar la misma red a varios contenedores para permitir la interconexion entre ellos de forma interna, crear redes sin conexión hacia fuera, incluso crear contenedores sin ninguna conexion de red.

Cuando instalamos docker por primera vez, de serie vienen 3 redes creadas. Para verlas usaremos el siguiente comando:

```Shellsession
$ docker network ls

NETWORK ID          NAME                DRIVER
7fca4eb8c647        bridge              bridge
9f904ee27bf5        none                null
cf03ee007fb4        host                host
```

Podemos ver tres redes, la red "bridge" es la red por defecto que usan los conetenedores que arrancamos. Es una tipo de red que da conexión hacia fuera. La red "host" es una red que solo permite la conexion interna pero no hacia fuera.

Podremos crear nuevas redes con el siguiente comando:
```Shellsession
$ docker network create -d bridge net_testing
41485bed1aabb49f1ca5cbe323638f91d62b52ab2210fa3a9b52d12ee8a55e7b
$ docker network ls
NETWORK ID          NAME                DRIVER              SCOPE
13201cf644ce        bridge              bridge              local
fc80d547b6bf        host                host                local
41485bed1aab        net_testing         bridge              local
843cd047b585        none                null                local
```

Con la opción ***-d*** podemos indicar que tipo de red queremos (bridge, host, none)

## 1.6 Enlazar contenedores

Vamos a enlazar dos contenedores para que se vean entre ellos usando la opción ***link***:

Primero arrancamos el contenedor de docker destino:
```Shellsession
$ docker run --rm -d -p 5060:5060 -e NCPORT=5060 --name firstrun oneboxtm/firstrun:1.0
Unable to find image 'oneboxtm/firstrun:1.0' locally
1.0: Pulling from oneboxtm/firstrun
2fdfe1cd78c2: Pull complete
7ad7ef040bbc: Pull complete
338ec0baead8: Pull complete
Digest: sha256:f2d85e61bbb4cfccd2813d8022d2620fc0c56e398f75b4cac31cb3181507e30f
Status: Downloaded newer image for oneboxtm/firstrun:1.0
b3fa845cc214afe46c02ef60db631135272c2c8f2389116f7101c4426f13b7b4
```

Seguidamente arrancamos otro contenedor creando un link al primero y ejecutamos un telent al puerto 5060 del contenedor destino usando el alias que le hemos indicado:

```Shellsession
$ docker run --rm -ti --link firstrun:target --name client busybox sh
Unable to find image 'busybox:latest' locally
latest: Pulling from library/busybox
57310166fe88: Pull complete
Digest: sha256:1669a6aa7350e1cdd28f972ddad5aceba2912f589f19a090ac75b7083da748db
Status: Downloaded newer image for busybox:latest
/ # telnet target 5060
test
^]
Console escape. Commands are:

 l	go to line mode
 c	go to character mode
 z	suspend telnet
 e	exit telnet
e
/ # ping target
PING target (172.17.0.2): 56 data bytes
64 bytes from 172.17.0.2: seq=0 ttl=64 time=0.104 ms
^C
--- target ping statistics ---
1 packets transmitted, 1 packets received, 0% packet loss
round-trip min/avg/max = 0.104/0.104/0.104 ms
/ # cat /etc/hosts
127.0.0.1	localhost
::1	localhost ip6-localhost ip6-loopback
fe00::0	ip6-localnet
ff00::0	ip6-mcastprefix
ff02::1	ip6-allnodes
ff02::2	ip6-allrouters
172.17.0.2	target b3fa845cc214 firstrun
172.17.0.3	97dfd89d0a46
```

Como podemos observar nos hemos podido conectar al contenedor destino usando el alias indicado. También hemos podido hacer ping. Al final mostramos el fichero /etc/hosts donde se ve la entrada que automaticamente ha añadido docker.

A continuación mostramos el log del contenedor destino para verificar que realmente hemos llegado:

```Shellsession
$ docker logs -f firstrun
#####################
ENVIRONMENT VARIABLES
NCPORT=5060
HOSTNAME=b3fa845cc214
SHLVL=1
HOME=/root
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
PWD=/
#####################
Listening on [0.0.0.0] (family 0, port 5060)
Connection from 172.17.0.3 33328 received!
test
```

Ahora vamos a usar la red ***net_testing*** que hemos creado en el ejemplo anterior para conectar los dos contenedores:

```Shellsession
$ docker run --rm -d -p 5060:5060 -e NCPORT=5060 --name firstrun --network net_testing oneboxtm/firstrun:1.0
c46ce878881e6ae7a09ebe95911d87961d49807c32539b3606f73bb967a43b8a
$ docker run --rm -ti --network net_testing --name client busybox sh
/ # cat /etc/hosts
127.0.0.1	localhost
::1	localhost ip6-localhost ip6-loopback
fe00::0	ip6-localnet
ff00::0	ip6-mcastprefix
ff02::1	ip6-allnodes
ff02::2	ip6-allrouters
172.18.0.3	dc5cefb153ba
/ # ping firstrun
PING firstrun (172.18.0.2): 56 data bytes
64 bytes from 172.18.0.2: seq=0 ttl=64 time=0.190 ms
/ # telnet firstrun 5060
test
^]

Console escape. Commands are:

 l	go to line mode
 c	go to character mode
 z	suspend telnet
 e	exit telnet
e
```

Como vemos, al añadir los dos contenedores a la misma red, estos quedan enlazados automaticamente. De esta forma, en vez de añadir una entrada dentro del fichero /etc/hosts, docker crea una entrada con los nombres de los contenedores en un servidor dns interno. Por esa razón podemos hacer llamadas al contenedor por su nombre (***firstrun***)
De esta manera no necesitamos añadir contenedores en ningun orden y todos los que añadamos a la red podran ser enlazados.

## 1.7 Arrancar un contenedor con volumen persistente

Cuando usamos contendores de docker la información es efímera. Es decir, todos los ficheros que modifiquemos desapareceran junto con el contenedor. Para poder tener persistencia la opcion mas usada es montar un directorio dentro del contenedor. Esto hará que se compartan los datos con el host y que cuando el contenedor desaparezca, estos persistan.
Para poder montar volúmenes de forma sencilla usaremos la opcion ***-v*** de docker, donde el primer argumento es el directorio local y el segundo el directorio destino dentro de la imagen de docker, siempre separado por dos puntos (:)

```ShellSession
✔ ~/sandbox/formation
$ ls -la
total 0
drwxr-xr-x   2 mikim  staff   64 26 mar 11:56 .
drwxr-xr-x  13 mikim  staff  416 19 mar 08:54 ..
✔ ~/sandbox/formation
$ docker run -ti --rm -v ${PWD}:/workspace oneboxtm/firstrun:1.0 bash
bash-4.4# ls
bin            entrypoint.sh  home           media          proc           run            srv            tmp            var
dev            etc            lib            mnt            root           sbin           sys            usr            workspace
bash-4.4# cd /workspace/
bash-4.4# ls
bash-4.4# exit
✔ ~/sandbox/formation
$ ls -al
total 0
drwxr-xr-x   2 mikim  staff   64 26 mar 11:56 .
drwxr-xr-x  13 mikim  staff  416 19 mar 08:54 ..
✔ ~/sandbox/formation
$ ls -la
total 0
drwxr-xr-x   2 mikim  staff   64 26 mar 11:56 .
drwxr-xr-x  13 mikim  staff  416 19 mar 08:54 ..
✔ ~/sandbox/formation
$ echo "Test1" > fichero.txt
✔ ~/sandbox/formation
$ docker run -ti --rm -v ${PWD}:/workspace oneboxtm/firstrun:1.0 bash
bash-4.4# cd /workspace/
bash-4.4# cat fichero.txt
Test1
bash-4.4# echo "Test2" >> fichero.txt
bash-4.4# exit
exit
✔ ~/sandbox/formation
$ cat fichero.txt
Test1
Test2
```

Esta forma es válida para pruebas rapidas o cosas sencillas, pero si necesitamos algo mas complejo, como que dos contenedores usen el mismo volumen, etc.. deberemos usar la opcion ***volume*** de docker.
Esta opción consiste en primer crear un volumen que gestionará docker para luego usarlo en los contenedores que necesitemos. Este volumen será persistente.

Creamos un volumen que llamaremos ***volumen1***:
```ShellSession
$ docker volume create --label datos volumen1
volumen1
$ docker volume ls
DRIVER              VOLUME NAME
local               volumen1
```

Ahora arrancamos un contenedor indicando que use el volumen recien creado, creamos un fichero temporal, destruimos el contenedor y arrancamos otro contenedor con el mismo volumen para comprobar que efectivamente el contenido esta intacto:

```ShellSession
$ docker run -ti --name voltest1 -v volumen1:/app ubuntu
root@6e98ad238d9d:/# echo "testing" > /app/testfile.txt
root@6e98ad238d9d:/# exit
$ docker run -ti --name voltest2 -v volumen1:/app alpine
/ # cat /app/testfile.txt
testing
```




## 1.8 Wordpress + mysql

Vamos a crear un ejemplo de dos contenedores, uno con apache y wordpress y otro con un mysql que usará wordpress para guardar los datos. Como no queremos perder los datos de mysql, usaremos un volumen para la persistencia. La conectividad entre wordpress y mysql se realizará usando nombres de DNS. También guardaremos los datos de plugins y temas de wordpress en un volumen, para poder compartirlo en caso de querer levantar mas contenedores.

Para empezar crearemos la red de docker donde correran nuestros contenedores:

```ShellSession
$ docker network create wordpressnet
aa4e6239956bc7279b4de0df930ac24191c0670a65fdcae38968f97e487e86ed
✔ ~
11:35 $ docker network ls
NETWORK ID          NAME                DRIVER              SCOPE
2a56b9fcd39f        bridge              bridge              local
85d7021af908        host                host                local
cd61e7d64b62        none                null                local
537b2493b5f7        wordpressnet        bridge              local
```

A continuación, crearemos el volumen que usará el contenedor de mysql:
```ShellSession
$ docker volume create mysql
mysql
$ docker volume ls
DRIVER              VOLUME NAME
local               mysql
```
Ahora solo nos queda arrancar el contenedor de mysql, usando la red y el volumen que hemos creado. Tambien le indicaremos que al arrancar cree un schema, usuario y contraseña para wordpress:
```ShellSession

$ docker run -d --network wordpressnet -v mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=rootpassword -e MYSQL_DATABASE=wordpress -e MYSQL_USER=wp -e MYSQL_PASSWORD=wppassword --name wp_mysql mysql:latest
03039608fe6518f45748226dfbd134ee7191f8dbb1bc921e08a0b602ec5451bc
```

Comprobamos que se ha creado el schema y que podemos acceder las credenciales:
```ShellSession

$ docker exec -ti wp_mysql mysql -uwp -pwppassword -e "show databases"
mysql: [Warning] Using a password on the command line interface can be insecure.
+--------------------+
| Database           |
+--------------------+
| information_schema |
| wordpress          |
+--------------------+
```

Como ya tenemos listo mysql, nos toca crear y configurar el contenedor de wordpress. Creamos un volumen:

```ShellSession
$ docker volume create wordpress
wordpress
```

Y ahora arrancamos un contenedor usando la red y el volumen que hemos creado. Ademas le indicamos los datos de conexion a mysql:

```ShellSession
$docker run -d --network wordpressnet -v wordpress:/var/www/html -e WORDPRESS_DB_HOST=wp_mysql -e WORDPRESS_DB_NAME=wordpress -e WORDPRESS_DB_USER=wp -e WORDPRESS_DB_PASSWORD=wppassword -p 8080:80 --name wordpress wordpress:latest
```

Ahora ya podemos ir via nuestro navegador a http://localhost:8080 y realizar los pasos de la instalación.

```ShellSession
open http://localhost:8080
```


En este punto ya tenemos un contenedor con wordpress que usa un mysql corriendo en otro contenedor. 
Ahora vamos a hacer algo similar pero con dos contenedores wordpress apuntando al mismo mysql, sirviendo el mismo contenido y con un balanceador de carga por delante.
Primero de todo apagaremos y borraremos el contenedor de wordpress que habiamos creado para volver a crear dos nodos iguales pero con diferente nombre:

```ShellSession
$ docker stop wordpress; docker rm wordpress
$ docker run -d --network wordpressnet -v wordpress:/var/www/html -e WORDPRESS_DB_HOST=wp_mysql -e WORDPRESS_DB_NAME=wordpress -e WORDPRESS_DB_USER=wp -e WORDPRESS_DB_PASSWORD=wppassword --name wordpress1 wordpress:latest
$ docker run -d --network wordpressnet -v wordpress:/var/www/html -e WORDPRESS_DB_HOST=wp_mysql -e WORDPRESS_DB_NAME=wordpress -e WORDPRESS_DB_USER=wp -e WORDPRESS_DB_PASSWORD=wppassword --name wordpress2 wordpress:latest
```

Ahora para el balanceador de carga (haproxy) crearemos un volumen donde guardaremos su configuración:

```ShellSession
docker volume create haproxy
```

Y a continuación, crearemos un fichero de configuración:
```ShellSession
docker run -ti -v haproxy:/haproxy busybox vi /haproxy/haproxy.cfg
```

Ahora copiamos y pegamos:
```
global
    log 127.0.0.1   local0
    log 127.0.0.1   local1 notice

defaults
    log     global
    mode    http
    option  httplog
    option  dontlognull
    option forwardfor
    option http-server-close
    timeout connect 5000
    timeout client 50000
    timeout server 50000

frontend all
    bind *:80
    default_backend wordpress_80

backend wordpress_80
   balance roundrobin
   server wordpress1 wordpress1:80 check
   server wordpress2 wordpress2:80 check
```

Para acabar, arrancaremos un contenedor con haproxy, usando la red y el volumen que hemos creado:
```ShellSession
docker run -d --network wordpressnet --name haproxy -p 8080:80 -v haproxy:/usr/local/etc/haproxy:ro haproxy:latest
```

Ahora ya podemos volver a abrir la url http://localhost:8080 y veremos nuestro wordpress de nuevo.
Para comprobar que realmente se estan balanceando las peticiones solo hay que mirar los logs de los contenedores wordpress.


## 1.9 Docker-compose

Si tuvieramos que hacer despliegues similares al que hemos hecho en el punto 1.8 muy a menudo, seria recomendado usar la herramienta docker-compose. 
Con docker-compose podemos orquestrar la creacion y configuracion de uno o mas componentes de docker de una sola vez. En la carpeta ***docker-compose*** hay un ejemplo de como crear el ejemplo anterior via docker-compose:

```ShellSession
$ cd docker-compose
$ docker-compose up
Creating wp_mysql ... done
Creating wordpress1 ... done
Creating wordpress2 ... done
Creating haproxy    ... done
Attaching to wp_mysql, wordpress1, wordpress2, haproxy
...
```
Y para borrar todos los objetos creados:
```ShellSession
$ docker-compose rm
Going to remove haproxy, wordpress2, wordpress1, wp_mysql
Are you sure? [yN] y
Removing haproxy    ... done
Removing wordpress2 ... done
Removing wordpress1 ... done
Removing wp_mysql   ... done
```
