FROM debian:stretch

MAINTAINER Tiago Veiga Lázaro <tiago@unravelling.io>

ENV EMS_PORT 7222
ENV EMS_VERSION 8.3
ENV EMS_CONFIG /tibco/config/tibemsd.json

ADD ems-*.tar.gz /tibco/
COPY config /tibco/config

RUN groupadd tibco && \
    useradd -g tibco tibco && \
    mkdir -p /tibco/config/store && \
    mkdir /tibco/config/logs && \
    chown -R tibco:tibco /tibco

USER tibco

EXPOSE $EMS_PORT

ENTRYPOINT /tibco/ems/$EMS_VERSION/bin/tibemsd64 -config $EMS_CONFIG
