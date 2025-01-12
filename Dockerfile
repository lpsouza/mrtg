FROM ubuntu:20.04

ENV TZ=America/Sao_Paulo
ENV DEBIAN_FRONTEND=noninteractive

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get install -y mrtg apache2

COPY entrypoint.sh /entrypoint.sh

EXPOSE 80

ENTRYPOINT [ "/bin/bash", "/entrypoint.sh" ]
