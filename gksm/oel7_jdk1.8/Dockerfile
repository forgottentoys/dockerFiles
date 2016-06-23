#
# software Dockerfile
# 
# Installing jdk1.8 in oraclelinux:7
#

# Pull base image.
FROM gksm/oel7_basesoft:latest 

MAINTAINER Evgenii.Poliakov@gmail.com

RUN mkdir -p /opt/oracle/java
ADD jdk-*-linux-x64.tar.gz /opt/oracle/java/
RUN ln -s /opt/oracle/java/jdk* /opt/oracle/java/latest
RUN find /opt/oracle/java/latest/jre/lib/security/* -name java.security -type f -exec sed -i -r 's/securerandom.source=file:\/dev\/random/securerandom.source=file:\/dev\/.\/urandom/g' {} \;
ENV PATH=/opt/oracle/java/latest/bin:$PATH
ENV JAVA_HOME=/opt/oracle/java/latest

CMD /bin/bash

