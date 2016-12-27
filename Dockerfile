
FROM ubuntu:16.04

MAINTAINER Damon Prater <damon@inxaos.com>

# Update and install transmission packages
RUN add-apt-repository ppa:transmissionbt/ppa && \
    apt-get update && \
    apt-get install -y transmission-cli transmission-common transmission-daemon && \
    apt-get clean

ADD settings.json /var/lib/transmission/.config/transmission-daemon

VOLUME ["/torrents", "/downloads"]

RUN systemctl enable transmission-daemon

ENTRYPOINT ["systemctl", "restart", "transmission-daemon"]
