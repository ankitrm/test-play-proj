FROM openjdk:8-jre

ARG PROJ_NAME=test-play-proj
ARG PROJ_VERSION=1.0
ARG SBT_VERSION=0.13.16

RUN \
  curl -L -o sbt-$SBT_VERSION.deb http://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb && \
  dpkg -i sbt-$SBT_VERSION.deb && \
  rm sbt-$SBT_VERSION.deb && \
  apt-get update && \
  apt-get install sbt && \
  sbt sbtVersion

EXPOSE 9000 9443

WORKDIR /$PROJ_NAME
COPY svc /$PROJ_NAME

CMD bin/start -Dhttp.port=9000 -Dplay.crypto.secret=secret
