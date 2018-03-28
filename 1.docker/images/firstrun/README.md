# firsrun docker image
## Imagen de docker para uso formativo

- Para arrancarla de la forma mas básica:
```sh
docker run -ti oneboxtm/firstrun:1.0
```

- Para arrancarlo con netcat activado
```sh
docker run -ti -p 5060:5060 -e NCPORT=5060 oneboxtm/firstrun:1.0
```

- Para construir la imagen
```sh
docker build . -t oneboxtm/firstrun
```
