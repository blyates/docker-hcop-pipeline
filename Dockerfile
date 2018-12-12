FROM centos:6
MAINTAINER Beth Yates <byates@ebi.ac.uk>

WORKDIR /home/pipeline/

COPY build.sh /

RUN /build.sh


