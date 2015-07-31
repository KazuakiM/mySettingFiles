#!/bin/sh
#--------------------------------
# PHP setting
#
# @author KazuakiM
#--------------------------------
#variable {{{
log=/var/log/vagrantfile.log
#}}}
echo "PHP setting ..."
yum -y --enablerepo=epel,remi,rpmforge install php php-devel                     >> $log 2>> $log && \
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin >> $log 2>> $log