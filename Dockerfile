FROM openjdk:8-jre-alpine

ARG PROJ_NAME=test-play-proj

RUN apk add -U bash docker

EXPOSE 9000 9443

WORKDIR /$PROJ_NAME
COPY svc /$PROJ_NAME

CMD bin/start -Dhttp.port=9000 -Dplay.crypto.secret=secret
