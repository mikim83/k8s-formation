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
