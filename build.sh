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
