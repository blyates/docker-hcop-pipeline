FROM centos:6
MAINTAINER Beth Yates <byates@ebi.ac.uk>

COPY build.sh /

RUN /build.sh

ENV PATH $PATH:/home/src/ensembl-perl/ensembl-hive/scripts
ENV PERL5LIB ${PERL5LIB}:/home/pipeline/Genefam/modules
ENV PERL5LIB ${PERL5LIB}:/home/pipeline/HCOP/modules
ENV PERL5LIB ${PERL5LIB}:/home/src/ensembl-perl/ensembl/modules
ENV PERL5LIB ${PERL5LIB}:/home/src/ensembl-perl/ensembl-hive/modules

WORKDIR /home/pipeline/
