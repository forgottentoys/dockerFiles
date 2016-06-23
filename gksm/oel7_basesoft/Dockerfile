#
# software Dockerfile
# 
# Installing basic software set for oraclelinux:7
#

# Pull base image.
FROM oraclelinux:7

MAINTAINER Evgenii.Poliakov@gmail.com
RUN rm -f /etc/localtime && \
ln -s /usr/share/zoneinfo/Europe/Moscow /etc/localtime

RUN curl -o /etc/yum.repos.d/public-yum-ol7.repo http://public-yum.oracle.com/public-yum-ol7.repo && \
yum -y install nc tar wget git && \
yum clean all;

CMD /bin/bash
WORKDIR /root

