#
# software Dockerfile
# 
# Installing basic software set for oraclelinux:7
#

# Pull base image.
FROM gksm/oel7_basesoft:latest

MAINTAINER Evgenii.Poliakov@gmail.com

RUN rpm -Uvh http://repos.mesosphere.com/el/7/noarch/RPMS/mesosphere-el-repo-7-2.noarch.rpm && \
yum -y install mesos && \
yum clean all;

EXPOSE  5050

#CMD /usr/bin/mesos-init-wrapper master
CMD /usr/sbin/mesos-master
