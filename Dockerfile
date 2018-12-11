FROM centos:6
MAINTAINER Beth Yates <byates@ebi.ac.uk>

COPY build.sh /

RUN /build.sh

WORKDIR /var/www/
