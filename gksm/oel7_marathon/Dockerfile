#
# software Dockerfile
# 
# Installing basic software set for oraclelinux:7
#

# Pull base image.
FROM gksm/oel7_jdk1.8:latest 

MAINTAINER Evgenii.Poliakov@gmail.com

RUN rpm -Uvh http://repos.mesosphere.com/el/7/noarch/RPMS/mesosphere-el-repo-7-2.noarch.rpm && \
yum -y install mesos marathon && \
yum clean all;

#RUN localectl set-locale LANG=en_US.UTF-8 

CMD ["marathon"]

