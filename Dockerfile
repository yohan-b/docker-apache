FROM debian:stretch
MAINTAINER yohan <783b8c87@scimetis.net>
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -y install apache2 libapache2-mod-php
ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
COPY apache2.conf /etc/apache2/
COPY other-vhosts-access-log.conf /etc/apache2/conf-available/
COPY 000-default.conf /etc/apache2/sites-available/
ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
