FROM openjdk:8-jre-alpine

ARG basedir=src/main/docker

COPY ${basedir}/assets/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["bin/sh", "/entrypoint.sh"]
    
