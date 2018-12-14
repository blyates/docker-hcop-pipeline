#!/bin/bash

yum -y update && yum clean all;
yum -y install wget
yum -y install tar
yum -y install gcc
yum -y install zlib-devel
yum -y install sudo
yum -y install git

service iptables stop;
chkconfig iptables off;
rm -rf /etc/rc.d/init.d/iptables

yum -y install perl-CPAN
curl -L http://cpanmin.us | perl - App::cpanminus

wget http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
rpm -ivh epel-release-6-8.noarch.rpm

yum -y install perl-DBD-mysql perl-DBI
yum -y install perl-DBD-Pg
yum -y install which
yum -y install perl-Test-Most
yum -y install expat-devel
yum -y install perl-GraphViz
yum -y install perl-XML-Simple
yum -y install "perl(XML::LibXML)"
yum -y install perl-Crypt-SSLeay

yum -y install perl-SOAP-Lite
yum -y install perl-IO-Socket-SSL
yum -y install mysql-server
/sbin/chkconfig --levels 235 mysqld on

cpanm -f Bio::Perl

mkdir /home/src;
cd /home/src;
mkdir ensembl-perl;
cd ensembl-perl;
git clone https://github.com/Ensembl/ensembl.git;
cd ensembl;
git fetch
git checkout -b release/77 origin/release/77;
cpanm --installdeps . 
cd ../;
git clone https://github.com/Ensembl/ensembl-hive.git;
cd ensembl-hive;
git fetch
git checkout -b version/2.1 origin/version/2.1;
cpanm --installdeps .
ls -al;
