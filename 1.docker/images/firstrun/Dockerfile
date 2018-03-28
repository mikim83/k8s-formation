FROM alpine:3.7
MAINTAINER Miki Monguilod, mmonguilod@oneboxtm.com
ADD entrypoint.sh /

RUN apk update && apk add bash netcat-openbsd

CMD ["/entrypoint.sh"]
